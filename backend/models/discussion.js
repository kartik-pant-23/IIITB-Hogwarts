const mongoose = require("mongoose")
const Schema = mongoose.Schema

const discussionSchema = new Schema({
    discussion_title: {
        type: String, required: true
    },
    banner_url: {
        type: String, required: true
    },
    chat: {
        type: Array, default: []
    }
})

module.exports = mongoose.model("Discussions", discussionSchema)