const express = require('express');
const router = express.Router();
const User = require("../models/user");

router.get("/", function(req, res) {
    const token = req.originalUrl;

    User.findOne({token: token}, function(user) {
        if(!user)
        {
            res.status(404);
        }
        else
        {
            User.findOneAndUpdate({_id: user._id}, {token: "", isVerified: true}, function(user, err) {
                if(err)
                {
                    res.status(500);
                }
                res.status(200);
            })
        }
    })
})

module.exports = router;