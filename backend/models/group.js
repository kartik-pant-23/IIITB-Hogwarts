const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const groupSchema = new Schema({
    name: {
      type: String,
      required: true
    },
    numOfMembers: {
      type: Number,
      required: true
    },
    tagline: {
      type: String,
      required: true
    },
    legacySpell: {
      type: String,
      required: true
    },
    Dumbeldore: {
      type: String,
      required: true
    }
});

module.exports = mongoose.model("Groups",groupSchema);
