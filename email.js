const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
  host: process.env.EMAIL_HOST, // Microsoft Outlook SMTP server
  port: process.env.EMAIL_PORT,
  secure: false, // true for 465, false for other ports
  auth: {
    user: process.env.EMAIL_USER, // Your email
    pass: process.env.EMAIL_PASSWORD // Your password
  }
//   tls: {
//     ciphers: 'SSLv3'
// }
});

function sendEmail({ to, subject, text }, callback) {
  const mailOptions = {
    from:  `NoteworthyWebDevTeam <${process.env.EMAIL_USER}>`,
    to: to,
    subject: subject,
    text: text
  };
  transporter.sendMail(mailOptions, callback);
}

function emailText(name, email, musician, message) {
  return `
  Hi NoteworthyConnection,

  This is a test.

  Connection from: ${name} <${email}>
  Their preferred musician: ${musician}
  Their message: ${message}

  Best,
  WebDevTeam
  `
}

module.exports = {sendEmail, emailText};

