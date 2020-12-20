const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const blogSchema = new Schema({
    title: {
      type: String,
      required: true
    },
    content: {
      type: String,
      required: true
    },
    comments: [{
      type: String
    }],
    likes: {
      type: Number
    },
    img: {
      data: Buffer,
      contentType: String
    }
});

module.exports = mongoose.model("Blogs",blogSchema);
