const express = require("express");
const router = express.Router();
const crypto = require("crypto");
const nodemailer = require("nodemailer");
const mongoose = require('mongoose');

const User = require("../models/user");

const groupNames = [
  mongoose.Types.ObjectId("5ff7359e2146903eb88f59fb"),
  mongoose.Types.ObjectId("5ff73650af75fa4714ac6577"),
  mongoose.Types.ObjectId("5ff7368baf75fa4714ac6578"),
  mongoose.Types.ObjectId("5ff736c5af75fa4714ac6579")
];

/* GET registration page. */
router.get("/", function (req, res, next) {
  res.send("Register route"); //add registration form source here
});

/* register the user in database */
router.post("/", function (req, res) {
  g0 = groupNames[0].numOfMembers;
  g1 = groupNames[1].numOfMembers;
  g2 = groupNames[2].numOfMembers;
  g3 = groupNames[3].numOfMembers;
  minimum = Math.min(g0,g1,g2,g3);//Math.floor(Math.random() % 4);
  if(minimum==g0){
    groupNum = 0;
  }
  else if(minimum==g0){
    groupNum = 1;
  }
  else if(minimum==g0){
    groupNum = 2;
  }
  else {
    groupNum=3;
  }
  const user = new User({
    name: req.body.name,
    email: req.body.email,
    password: req.body.password,
    group: groupNames[groupNum], //Decide later the algorithm.. Currently it is random
    isVerified: false,
    token: crypto.randomBytes(16).toString("hex"),
  })

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
