const express = require('express')
const router = express.Router()

router.get('/', (req, res) => {
  const name = req.query.p
  res.render('connect/index', {
    name: name
  })
})

module.exports = router