const express = require('express')
const router = express.Router()
const { fetchPrimaryCategories } = require('../database')
const fs = require('fs');
const path = require('path')


router.get('/', async (req, res) => {
  const categories = await fetchPrimaryCategories();
  
  res.render('index', {
    categories: categories,
    lang: req.lang
  })
})

router.get('/about-us', (req, res) => {
  // const navigationJSON = {
  //   noteworthy: '/',
  //   'About Us': '/about-us'
  // }
  res.render('main/aboutUs')
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