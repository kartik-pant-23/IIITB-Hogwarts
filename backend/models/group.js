const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const groupSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    name: {
      type: String,
      required: true
    },
    numOfMembers: {
      type: Number,
      required: true,
      default: 0
    },
    tagline: {
      type: String,
      required: true
    },
    group_score: {
      type: Number,
      default: 0
    },
    chat: {
      type: Array, 
      default:[]
    },
    group_logo: {
      type: String,
      required: true
    }
    // legacySpell: {
    //   type: String,
    //   required: true
    // },
    // Dumbeldore: {
    //   type: String,
    //   required: true
    // }
});

module.exports = mongoose.model("Groups",groupSchema);
