const express = require('express')
const { sendEmail, emailText } = require('../email')
const router = express.Router()


router.get('/', (req, res) => {
  const musicianName = req.query.p
  res.render('connect/index', {
    musicianName: musicianName
  })
})

router.post('/submit', (req, res) => {
  const { name, email, musician, message } = req.body;
  const emailCotentText = emailText(name, email, musician, message);
  const emailContent = {
    to: process.env.EMAIL,
    subject: 'Hello World',
    text: emailCotentText
  };

  sendEmail(emailContent, (error, info) => {
    if (error) {
      console.log(error);
      res.send('error');
    } else {
      console.log('Email sent: ' + info.response);
      res.send('YOU ARE CONNECTED!');
    }
  });
})

module.exports = router