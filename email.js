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
    from: `NoteworthyEmailBot<${process.env.EMAIL}>`,
    to: to,
    subject: subject,
    text: text
  };
  transporter.sendMail(mailOptions, callback);
}

function emailText(name, email, musicians, message) {
  const musiciansArray = musicians.map(musician => musician.name).join(', ');
  return `
  Hi NoteworthyConnection,

  This is a test.

  Connection from: ${name} <${email}>
  Their preferred musician: ${musiciansArray}
  Their message:
  --------------------------------- 
  ${message}
  ---------------------------------
  Cheers,
  WebDevTeam
  `
}

module.exports = {sendEmail, emailText};

