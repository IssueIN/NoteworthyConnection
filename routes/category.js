const express = require('express')
const router = express.Router()
const { fetchMusicians, fetchCategories, fetchMusician, createMusician, fetchCategory, fetchCategoriesByMusicianId, fetchMusiciansByCategoryId } = require('../database')

router.get('/', async (req, res) => {
  try {
    const categories = await fetchCategories()
    res.render('category/index', {
      categories: categories
    })
  } catch (err) {
    console.error(err)
  }
})

router.get('/:id', async (req, res) => {
  const cid = req.params.id
  try {
    const musicians = await fetchMusiciansByCategoryId(cid);
    const category = await fetchCategory(cid)
    res.render('category/category', {
      category: category,
      musicians: musicians
    })
  } catch (err) {
    console.error(err)
  }
})

module.exports = router