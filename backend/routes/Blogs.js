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
router.get("/blogs", function (req, res) {
  res.render(""); //add blogging form source here
});

//Store the blog in the database
router.post("/blogs", upload.single("avatar"), function(req, res) {

  const blog = new Blog({
      Title: req.body.title,
      Content: req.body.content,
      Comments: req.body.comments,
      Likes: req.body.likes,
      img: req.file
  });

  blog.save(function (err, blog){
    if (err) {
      return res.status(500);
    }
    res.status(200);
  });

});

module.exports = router;
