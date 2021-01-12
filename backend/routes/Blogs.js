const express = require("express");
const router = express.Router();

const Blog = require("../models/blogs");

router.get('/', (req, res) => {
  Blog.find().sort({_id: -1}).exec()
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

//Store the blog in the database
router.post("/addBlog", function(req, res) {

  const {
    blog_title, 
    blog_url, 
    banner_url, 
    author_name, 
    author_year, 
    author_uid} = req.body

  const blog = new Blog({
      blog_title: blog_title,
      blog_url: blog_url,
      banner_url: banner_url,
      author_name: author_name,
      author_year: author_year,
      author_uid: author_uid
  });

  blog.save()
  .then((blog) => {
    res.status(200).json({
      message: 'Blog saved successfully!',
      data: blog
    })
  })
  .catch((error) => {
    res.status(error.status || 500).json({
      message: error.message || 'Unknown error!',
      error: error
    })
  })

});

module.exports = router;
