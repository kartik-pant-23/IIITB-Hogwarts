const express = require("express");
const router = express.Router();

const Group = require("../models/group");
const User = require("../models/user")

// GET data of all groups
router.get('/', (req, res) => {
  Group.find().exec()
  .then((groups) => {
    res.status(200).json({
      message: "Succesful!",
      data: groups
    })
  })
  .catch((error) => {
    res.status(error.status || 500).json({
      message: error.message || "Unknown error!",
      error: error
    })
  })
})

//get the group details
router.get("/:groupId",function(req,res){
  Group.findById(req.params.groupId)
  .exec()
  .then((group) => {
    (!group) 
      ?res.status(404).json({
        message: 'No such group exists!'
      })
      :User.find({group: req.params.groupId})
        .sort({score:-1})
        .select('_id name score about')
        .exec()
        .then((users) => {
          res.status(200).json({
            message: 'Successful!',
            data: {
              groupDetails: group,
              members: users
            }
          })
        })
        .catch((error) => {
          res.status(error.status || 500).json({
            message: error.message || 'Unknown error!',
            error: error
          })
        })
  })
  .catch((error) => {
    res.status(500).json({
      message: "Error occurred!",
      error: error
    })
  })
});

module.exports = router;