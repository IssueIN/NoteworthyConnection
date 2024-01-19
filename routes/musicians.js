const express = require('express')
const router = express.Router()
const { fetchMusicians, fetchCategories, fetchMusician, createMusician,fetchCategoriesByMusicianId } = require('../database')

router.get('/', async (req, res) => {
  const navigationJSON = {
    noteworthy: '/',
  }
  const musicians_key = req.t('musicians')
  navigationJSON[musicians_key] = '/musicians';
  try {
    const musicians = await fetchMusicians();
    const categories = await fetchCategories();
    res.render('musicians/index', {
      musicians: musicians,
      categories: categories,
      lang: req.lang,
      navigation: navigationJSON
    })
  } catch(err) {
    res.redirect('/')
    console.error(err)
  }
})

router.get('/:mid', async (req, res) => {
  const mid = req.params.mid;
  try {
    const musician = await fetchMusician(mid)
    const categories = await fetchCategoriesByMusicianId(mid)
    const navigationJSON = {
      noteworthy: '/',
    };
    const musicians_key = req.t('musicians')
    navigationJSON[musicians_key] = '/musicians';
    navigationJSON[musician['name_' +  req.lang]] = `/musicians/${mid}`;

    res.render('musicians/musician', {
      musician : musician,
      categories: categories,
      lang: req.lang,
      navigation: navigationJSON
    })
  } catch (err) {
    res.redirect('/musicians')
    console.error('Error Fetching Musician:', err)
  }
})

module.exports = router