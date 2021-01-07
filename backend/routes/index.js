const express = require("express")
const router = express.Router()

const Group = require("../models/group")
const Blogs = require("../models/blogs")

router.get('/', (req, res) => {
    var groupsDetails, blogDetails;
    
    Group.find()
    .select('_id name group_score')
    .exec()
    .then((groups) => {
        groupsDetails = groups;
        Blogs.find()
        .exec()
        .then((blogs) => {
            blogDetails = blogs;
            res.status(200).json({
                message: "All details!",
                groups: groupsDetails,
                blogs: blogDetails
            })
        })
        .catch((error) => {
            res.status(500).json({
                message: error.message || "Something went wrong!"
            })
        })
    })
    .catch((error) => {
        res.status(500).json({
            message: error.message || "Something went wrong!"
        })
    })

});

module.exports = router;