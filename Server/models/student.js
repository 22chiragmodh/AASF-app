const mongoose = require("mongoose");

var validateEmail = function (email) {
  var re = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  return re.test(email);
};

const StudentSchema = new mongoose.Schema(
  {
    email: {
      type: String,
      required: "Email address is required",
      trim: true,
      unique: true,
      validate: [validateEmail, "Please fill a valid email address"],
    },
    avatar: String,

    user_verified: {
      type: Boolean,
      required: true,
      default: false,
    },
  },
  {
    timestamps: true,
  }
);
module.exports = mongoose.model("student", StudentSchema);
