const express = require("express");
const router = express.Router();
const crypto = require("crypto");
const nodemailer = require("nodemailer");

const User = require("../models/user");

const groupNames = ["Name1", "Name2", "Name3", "Name4"];

/* GET registration page. */
router.get("/register", function (req, res, next) {
  res.render(""); //add registration form source here
});

/* register the user in database */
router.post("/register", function (req, res) {
  groupNum = Math.floor(Math.random() * 4);

  const user = new User({
    firstName: req.body.firstName,
    lastName: req.body.lastName,
    email: req.body.email,
    scholar: req.body.scholar,
    password: req.body.password,
    group: groupNames[groupNum], //Decide later the algorithm.. Currently it is random
    isVerified: false,
    token: crypto.randomBytes(16).toString("hex"),
  });

  user.save(function (err, user) {
    if (!err) {
      const transporter = nodemailer.createTransport({
        service: "Gmail",
        auth: {
          user: process.env.GMAIL_USERNAME,
          pass: process.env.GMAIL_PASSWORD,
        },
      });
      const mailOptions = {
        from: "no-reply@iiitbhowgwarts.com",
        to: user.email,
        subject: "Account Verification Token",
        text:
          "Hello,\n\n" +
          "Please verify your account by clicking the link: \nhttp://" +
          req.headers.host +
          "/confirmation/" +
          user.token +
          ".\n",
      };
      transporter.sendMail(mailOptions, function (err) {
        if (err) {
          return res.status(500);
        }
        res
          .status(200);
      });
    }
  });
});

module.exports = router;
