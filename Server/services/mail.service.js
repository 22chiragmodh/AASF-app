const nodemailer = require("nodemailer");
var transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: process.env.GMAIL_ID,
    pass: process.env.GMAIL_PASSWORD,
  },
});
class MailerService {
  async sendOTP(email, otp) {
    const mailOptions = {
      from: process.env.GMAIL_ID,
      to: email,
      subject: `OTP for Login `,
      text: `${otp}`,
    };
    await transporter.sendMail(mailOptions);
  }
}
module.exports = new MailerService();
