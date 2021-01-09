const express = require("express");
const router = express.Router();

const Group = require("../models/group");

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
    res.status((group) ?200 :404).json({
      message: "Successful!",
      data: (group) ?group :"No such group!" 
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
