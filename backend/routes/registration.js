var express = require('express');
var router = express.Router();
const mongoose = require("mongoose");
//const bodyParser = require("body-parser");

mongoose.connect("mongodb://localhost:27017/IITB-Hogwarts_DB", {useNewUrlParser: true,useUnifiedTopology: true });
const User = mongoose.model("User",UserSchema);

var groupNames = ["Name1","Name2","Name3","Name4"];

//app.use(bodyParser.urlencoded({extended: true}));

/* register the user in database */
router.post('/register', function(req, res, next) {

  groupNum=Math.floor(Math.random()*4);

  const user = new User({
    firstName: req.body.firstName,
    lastName: req.body.lastName,
    email: req.body.email,
    scholar: req.body.scholar,
    password: req.body.password,
    group: groupNames[groupNum],//Decide later the algorithm.. Currently it is random
    token: ,//Prashant token ka dekh lena
    isVerified: false//develop a email verification route
  });

  user.save(function(err){
    if(!err){
        res.redirect("");//Source of page after successful registration
    }
  });

});

module.exports = router;
