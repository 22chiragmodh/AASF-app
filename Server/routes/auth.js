var express = require("express");
const { userVerification, otpVerification } = require("../controllers/auth");

var router = express.Router();

router.post("/studentverification", userVerification);
router.post("/otpverification", otpVerification);

module.exports = router;
