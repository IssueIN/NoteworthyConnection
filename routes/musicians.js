const express = require('express')
const router = express.Router()
const { fetchMusicians, fetchMusician, createMusician,fetchCategoriesByMusicianId } = require('../database')

router.get('/', (req, res) => {
  res.render('musicians/index')
})

router.get('/:mid', async (req, res) => {
  const mid = req.params.mid;
  try {
    const musician = await fetchMusician(mid)
    const categories = await fetchCategoriesByMusicianId(mid)
    res.render('musicians/musician', {
      musician : musician,
      categories: categories
    })
  } catch (err) {
    res.redirect('/musicians')
    console.error('Error Fetching Musician:', err)
  }
})

module.exports = router