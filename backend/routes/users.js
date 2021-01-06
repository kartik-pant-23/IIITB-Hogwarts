var express = require('express');
var router = express.Router();
const Users = require('../models/user');

/* GET users listing only of the particular group */
router.get('/:groupId', function(req, res, next) {
  Users.find({group: req.params.groupId})
  .exec()
  .select('_id name score')
  .then((users) => {
    res.status(200).json({
      count: users.length,
      data: users
    })
  })
  .catch((error) => {
    res.status(error.status || 500).json({
      message: error
    })
  })
});

/* GET details of particular user */
router.get('/:_id', function(req, res, next) {
  Users.findOne({_id: req.params._id})
  .exec()
  .then((user) => {
    res.status(200).json({
      data: user
    })
  })
  .catch((error) => {
    res.status(error.status || 500).json({
      message: error
    })
  })
});

/* PATCH for user edit profile */
router.patch('/:_id', (req, res) => {
  var updateBody = {
    about: req.body.about || '',
    id_facebook: req.body.id_facebook || '',
    id_instagram: req.body.id_instagram || '',
    id_github: req.body.id_github || '',
    id_linkedin: req.body.id_linkedin || '',
    id_twitter: req.body.id_twitter || '',
    id_youtube: req.body.id_youtube || '',
    id_personal: req.body.id_personal || ''
  }
  Users.findByIdAndUpdate(req.params._id, updateBody, (err, user) => {
    if(err) {
      res.status(err.status || 500).json({
        message: 'Something went wrong!'
      })
    } else {
      res.status(200).json({
        message: 'Success',
        data: user
      })
    }
  })
});

module.exports = router;