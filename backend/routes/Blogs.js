const express = require("express");
const multer  = require("multer");
const upload = multer({ dest: "uploads/" });
const router = express.Router();

const Blog = require("../models/blogs");

/* GET Blog posting form */
// Remember to include enctype in the form as below:
// <form action="/blogs" method="post" enctype="multipart/form-data">
//   <input type="file" name="avatar" />
// </form>

//Store the blog in the database
router.post("/blogs", upload.single("avatar"), function(req, res) {

  const blog = new Blog({
      title: req.body.title,
      content: req.body.content,
      img: req.file
  });

  blog.save(function (err, blog){
    if (err) {
      return res.statusCode(500);
    }
    return res.statusCode(200);
  });

});

module.exports = router;
