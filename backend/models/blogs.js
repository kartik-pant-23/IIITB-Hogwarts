const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const blogSchema = new Schema({
    blog_url: {
      type: String, required: true
    },
    blog_title: {
      type: String, required: true
    },
    banner_url: {
      type: String, required: true
    },
    author_name: {
      type: String, required: true
    },
    author_year: {
      type: String, required: true
    },
    author_uid: {
      type: mongoose.Types.ObjectId,
      required: true
    }
});

module.exports = mongoose.model("Blogs",blogSchema);
