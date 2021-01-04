const express = require("express")
const router = express.router

const Group = require("../models/group")
const Blogs = require("../models/blogs")

router.get('/', (req, res) => {
    var groupsDetails, blogDetails;
    
    // Find all the groups
    Group.find()
    .select('_id name group_score')
    .exec()
    .then((groups) => {
        groupsDetails = groups;
    })
    .catch((error) => {
        res.status(500).json({
            message: error.message || "Something went wrong!"
        })
    })

    // Find all the blogs
    Blogs.find()
    .exec()
    .then((blogs) => {
        blogDetails = blogs;
    })
    .catch((error) => {
        res.status(500).json({
            message: error.message || "Something went wrong!"
        })
    })

    // Also need to fetch details of current discussion

    // Everything found successfully, then return json
    res.status(200).json({
        groups: groupsDetails,
        blogs: blogDetails
    })

});

module.exports = router;