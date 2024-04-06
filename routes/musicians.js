const express = require('express')
const router = express.Router()
const { fetchMusicians, fetchCategories, fetchMusician, createMusician,fetchCategoriesByMusicianId } = require('../database')

router.get('/', async (req, res) => {
  try {
    const musicians = await fetchMusicians();
    const categories = await fetchCategories();

    for (const musician of musicians) {
      const muCat = await fetchCategoriesByMusicianId(musician.mid);
      musician.categories = muCat.slice(0,2)
    }

    res.render('musicians/index', {
      musicians: musicians,
      categories: categories,
      lang: req.lang
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