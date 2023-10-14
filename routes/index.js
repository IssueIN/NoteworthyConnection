const express = require('express')
const router = express.Router()

router.get('/', (req, res) => {
  res.render('index')
})

router.get('/about-us', (req, res) => {
  res.render('main/aboutUs')
})

router.get('/newsletter', (req, res) => {
  res.render('main/newsletter')
})

module.exports = router