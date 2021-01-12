const router = require("express").Router()
const Discussion = require("../models/discussion")
const mongoose = require("mongoose")

router.get('/', (req, res) => {
    Discussion.find().sort({_id: -1}).exec()
    .then((docs) => {
        res.status(200).json({
            message: "Successful!",
            count: docs.length,
            data: docs
        })
    })
    .catch((error) => {
        res.status(error.status || 500).json({
            message: error.message || "Unknown error!",
            error: error
        })
    })
})

router.post('/', (req, res) => {
    const discussion = Discussion({
        discussion_title: req.body.title,
        banner_url: req.body.banner_url
    })
    discussion.save()
    .then((doc) => {
        res.status(200).json({
            message: "Successfully created!",
            data: doc
        })
    })
    .catch((error) => {
        res.status(error.status || 500).json({
            message: error.message || "Unknown error!",
            error: error
        })
    })
})

module.exports = router