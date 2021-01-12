const express = require("express")
const router = express.Router()

const Group = require("../models/group")
const Blogs = require("../models/blogs")
const Discussions = require("../models/discussion")
const discussion = require("../models/discussion")

router.get('/', async (req, res) => {
    var groupsDetails, blogDetails;
    
    Group.find()
    .sort({group_score:-1})
    .select('_id name group_score group_logo tagline numOfMembers')
    .exec()
    .then((groups) => {
        groupsDetails = groups;
        Blogs.find()
        .sort({_id:-1})
        .select('blog_title blog_url banner_url author_name author_year')
        .exec()
        .then((blogs) => {
            blogDetails = blogs;
            Discussions.find().sort({_id:-1})
            .then((discussions) => {
                res.status(200).json({
                    message: "All details!",
                    groups: groupsDetails,
                    blogs: blogDetails,
                    discussions: discussions
                })
            })
            .catch((error) => {
                res.status(error.status || 500).json({
                    message: error.message || "Something went wrong!",
                    error: error
                })
            })
        })
        .catch((error) => {
            res.status(error.status || 500).json({
                message: error.message || "Something went wrong!",
                error: error
            })
        })
    })
    .catch((error) => {
        res.status(error.status || 500).json({
            message: error.message || "Something went wrong!",
            error: error
        })
    })

});

module.exports = router;