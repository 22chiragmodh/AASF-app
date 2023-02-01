const Student = require("../models/student");
const jwt = require("jsonwebtoken");
const { sendOTP } = require("../services/mail.service");
const OTP = require("../models/otp");

const userVerification = async (req, res) => {
  try {
    const { email } = req.body;
    if (!email)
      res.status(400).json({
        message: "please enter the valid Field",
      });

    if (await Student.findOne({ email }))
      res.status(200).json({ message: "User already exists" });
    const student = await Student.create({ email, user_verified: true });

    var num = Math.floor(1000 + Math.random() * 9000);

    await OTP.create({
      email: email,
      otp: num,
    });
    sendOTP(email, num);

    res.status(200).json({
      status: true,
      message: "otp sent to email",
      student,
    });
  } catch (err) {
    console.log(err);
    res.status(400).json({
      status: false,
      message: err.message,
    });
  }
};

const otpVerification = async (req, res) => {
  try {
    const { email, otp } = req.body;

    if (!otp)
      res.status(400).json({
        message: "please enter the Otp",
      });
    const student = await Student.findOne({ email });

    if (otp) {
      const otpCheck = await OTP.findOne({ email });

      if (otpCheck.otp == otp) {
        // user model meh is verified = true
        const token = jwt.sign(
          {
            student,
          },
          process.env.JWT_SECRET,

          { expiresIn: "1h" }
        );

        res.status(200).json({
          status: true,
          message: "User logged in successfully",
          token: token,
        });
      } else {
        res.status(200).json({
          status: false,
          message: "Invalid OTP",
        });
      }
    }
  } catch (err) {
    console.log(err);
    res.status(400).json({
      status: false,
      message: err.message,
    });
  }
};

module.exports = { userVerification, otpVerification };
