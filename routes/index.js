const express = require('express')
const router = express.Router()

router.get('/', (req, res) => {
  res.render('index')
})

router.get('/about-us', (req, res) => {
  const navigationJSON = {
    noteworthy: '/',
    'About Us': '/about-us'
  }
  res.render('main/aboutUs', {
    navigation: navigationJSON
  })
})

router.get('/newsletter', (req, res) => {
  const navigationJSON = {
    noteworthy: '/',
    newsletter: '/newsletter'
  }
  res.render('main/newsletter', {
    navigation: navigationJSON
  })
})

module.exports = router