const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const blogSchema = new Schema({
    Title: {
      type: String,
      required: true
    },
    Content: {
      type: String,
      required: true
    },
    Comments: [{
      type: String
    }],
    Likes: {
      type: Number
    },
    img: {
      data: Buffer,
      contentType: String
    }
});

module.exports = mongoose.model("Blogs",blogSchema);
