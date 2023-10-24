const express = require('express')
const { sendEmail, emailText } = require('../email')
const router = express.Router()
const {fetchMusicianId, createClient , createClientMessage, createClientPreferredMusician} = require('../database')


router.get('/', (req, res) => {
  const musicianName = req.query.p
  res.render('connect/index', {
    musicianName: musicianName
  })
})

router.post('/submit',async (req, res) => {
  const { name, email, musician, message } = req.body;
  const emailCotentText = emailText(name, email, musician, message);
  const emailContent = {
    to: process.env.EMAIL,
    subject: `Connect Request: From ${name}`,
    text: emailCotentText
  };

  console.log(musician)
  
  try {
    const mids = fetchMusicianId(musician)
    const clientId = await createClient(name, email);
    await createClientMessage(clientId, message);

    if (Array.isArray(mids)) {
      for (const mid of mids) {
          await createClientPreferredMusician(clientId, mid);
      }
  } else {
      await createClientPreferredMusician(clientId, mids);
  }

    sendEmail(emailContent, (error, info) => {
      if (error) {
        console.log(error);
        res.send('Email Error');
      } else {
        console.log('Email sent: ' + info.response);
        res.send('YOU ARE CONNECTED!');
      }
    });
  } catch (err) {
    console.error(err)
  }
})


module.exports = router