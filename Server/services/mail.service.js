const nodemailer = require("nodemailer");
var transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: process.env.GMAIL_ID,
    pass: process.env.GMAIL_PASSWORD,
  },
});
class MailerService {
  async sendOTP(email, link) {
    const mailOptions = {
      from: process.env.GMAIL_ID,
      to: email,
      subject: `Link for login`,
      text: `click here ${link} to login`,
    };
    await transporter.sendMail(mailOptions);
  }
}
module.exports = new MailerService();
