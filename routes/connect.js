const express = require('express')
const { sendEmail, emailText } = require('../email')
const router = express.Router()
const {fetchMusicians, fetchMusician, fetchMusicianId, createClient , createClientMessage, createClientPreferredMusician} = require('../database')


router.get('/', async (req, res) => {
  try{
    const musicians = await fetchMusicians();
    let filteredMusicians = musicians.map(musician => {
      return {
          mid: musician.mid,
          name: musician['name_' + req.lang]
      };
    });
    const musicianName = req.query.p
    res.render('connect/index', {
      musicianName: musicianName,
      musicians: filteredMusicians
    })
  } catch(err) {
    console.error(err)
  }

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
  
  try {
    const clientId = await createClient(name, email);
    await createClientMessage(clientId, message);

    for (const mid of musicians) {
      await createClientPreferredMusician(clientId, mid);
    }

    if (process.env.ENABLE_CONNECT === 'true') {
      sendEmail(emailContent, (error, info) => {
        if (error) {
          console.log(error);
          res.status(500).send('Email Error');
        } else {
          res.send('YOU ARE CONNECTED!');
        }
      });
    } else {
      res.send('Connect is currently disabled.');
    }
  } catch (err) {
    console.error(err)
  }
})


module.exports = router