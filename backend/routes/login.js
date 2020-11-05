var express = require("express");
var router = express.Router();
const Users = require("../models/users");

router.post("/", function (req, res, next) {
  Users.findOne(
    {
      email: req.body.email,
    },
    function (err, user) {
      if (!user) {
        return res.status(204);
      } else {
        if (user.isVerified) {
          user.comparePassword(req.body.password, function (err, isMatch) {
            if (!isMatch) {
              return res.status(401);
            } else {
              user.generateToken(function (err, user) {
                if (err) return res.status(500);
                else {
                  return res.cookie("your_auth", user.token).status(200);
                }
              });
            }
          });
        }

        return res.status(403);
      }
    }
  );
});

module.exports = router;
