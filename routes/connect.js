const express = require('express')
const router = express.Router()

router.get('/', (req, res) => {
  res.render('connect/index')
})

module.exports = router