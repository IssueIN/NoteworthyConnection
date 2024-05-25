const express = require('express')
const app = express()
const expressLayouts = require('express-ejs-layouts')
const bodyParser = require('body-parser')
const i18next = require('i18next')
const Backend = require('i18next-fs-backend')
const middleware = require('i18next-http-middleware')

i18next.use(Backend).use(middleware.LanguageDetector)
  .init({
    fallbacklang: 'en',
    backend: {
      loadPath: __dirname + '/locales/{{lng}}/{{ns}}.json',
    },
    preload: ['en', 'zh']
})

const indexRouter = require('./routes/index')
const musiciansRouter = require('./routes/musicians')
const connectRouter = require('./routes/connect')
const categoryRouter = require('./routes/category')

app.set('view engine', 'ejs')
app.set('views', __dirname + '/views')
app.set('layout', 'layouts/layout')
app.use(expressLayouts)
app.use(express.static('public'))
app.use(bodyParser.urlencoded({ extended: true }));
app.use(middleware.handle(i18next));
app.use((req, res, next) => {
  req.lang = 'zh'
  // req.lang = req.language.split('-')[0];
  next();
});

app.use('/', indexRouter)
app.use('/musicians', musiciansRouter)
app.use('/connect', connectRouter)
app.use('/category', categoryRouter)

app.use((err, req, res, next) => {
  console.error(err.stack)
  res.status(500).send('Something broke!')
})

app.listen(process.env.PORT || 3000, () => {
  console.log(`Server is running on port ${process.env.PORT ? process.env.PORT : 3000}`)
})