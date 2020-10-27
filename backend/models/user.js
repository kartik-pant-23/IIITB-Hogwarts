const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const bcrypt = require("bcrypt");
const saltRounds = 2;
const jwt = require("jsonwebtoken");

const UserSchema = new Schema({
    firstName: {
        type: String,
        required: true
    },
    lastName: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true
    },
    scholar: {
        type: String,
        required: true,
    },
    password: {
        type: String,
        minlength: 6,
        required: true
    },
    group: {
        type: Schema.Types.ObjectId,
        ref: "Groups"
    },
    token: {
        type: String
    },
    isVerified: {
        type: Boolean,
        default: false
    }
})


UserSchema.pre("save", function (next) {
    var user = this;

    if (user.isModified("password")) {
        bcrypt.genSalt(saltRounds, function (err, salt) {
            if (err)
                next(err);
            else {
                bcrypt.hash(user.password, salt, function (err, hash) {
                    if (err)
                        return next(err);
                    else {
                        user.password = hash;
                        next();
                    }
                })
            }
        })
    } else {
        next();
    }

})

UserSchema.methods.comparePassword = function (password, cb) {
    bcrypt.compare(password, this.password, function (err, isMatch) {
        if (err)
            return cb(err);
        else {
            return cb(null, isMatch);
        }
    })
}

UserSchema.methods.generateToken = function (cb) {
    var user = this;
    var token = jwt.sign(user._id.toHexString(), "secret");

    user.token = token;
    user.save(function (err, user) {
        if (err)
            return cb(err);
        else {
            return cb(null, user);
        }
    })
}

UserSchema.statics.findByToken = function (token, cb) {
    var User = this;

    jwt.verify(token, "secret", function (err, decode) {
        User.findOne({
            "_id": decode,
            "token": token
        }, function (err, user) {
            if (err)
                return cb(err);
            else
                return cb(null, user);
        })
    })
}

module.exports = mongoose.model("Users", UserSchema);
