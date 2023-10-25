const express = require('express')
const { sendEmail, emailText } = require('../email')
const router = express.Router()
const {fetchMusicians, fetchMusician, fetchMusicianId, createClient , createClientMessage, createClientPreferredMusician} = require('../database')


router.get('/', async (req, res) => {
  const musicians = await fetchMusicians();
  const musicianName = req.query.p
  res.render('connect/index', {
    musicianName: musicianName,
    musicians: musicians
  })
})

router.post('/submit',async (req, res) => {
  const { name, email, musicians, message } = req.body;
  const musicianNames = Array.isArray(musicians) ? await Promise.all(musicians.map(fetchMusician)) : [await fetchMusician(musicians)];
  const emailCotentText = emailText(name, email, musicianNames, message);
  const emailContent = {
    to: process.env.EMAIL,
    subject: `Connect Request: From ${name}`,
    text: emailCotentText
  };

  console.log(musicians)
  
  try {
    const clientId = await createClient(name, email);
    await createClientMessage(clientId, message);

    for (const mid of musicians) {
      await createClientPreferredMusician(clientId, mid);
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