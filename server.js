const express = require('express')
const app = express()
const expressLayouts = require('express-ejs-layouts')

const indexRouter = require('./routes/index')
const musiciansRouter = require('./routes/musicians')
const connectRouter = require('./routes/connect')
const categoryRouter = require('./routes/category')

const { fetchMusician, fetchMusicians, createMusician } = require('./database')

app.set('view engine', 'ejs')
app.set('views', __dirname + '/views')
app.set('layout', 'layouts/layout')
app.use(expressLayouts)
app.use(express.static('public'))

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