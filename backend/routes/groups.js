const express = require("express");
const router = express.Router();

const Group = require("../models/group");

//get the group details
router.get("/groups/:groupName",function(req,res){
  Group.findOne(
    {name: req.params.groupName},
    function(err,foundGroup){
      if(foundGroup){
        res.send(foundGroup);
      }else{
        res.send("Sorry, no matching group found!!!")
      }
    }
  );
});

module.exports = router;
