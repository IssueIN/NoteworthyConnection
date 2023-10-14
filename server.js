const express = require('express')
const app = express()
const expressLayouts = require('express-ejs-layouts')

const indexRouter = require('./routes/index')
const musiciansRouter = require('./routes/musicians')
const connectRouter = require('./routes/connect')

app.set('view engine', 'ejs')
app.set('views', __dirname + '/views')
app.set('layout', 'layouts/layout')
app.use(expressLayouts)
app.use(express.static('public'))

app.use('/', indexRouter
)
app.use('/musicians', musiciansRouter)
app.use('/connect', connectRouter)


app.listen(process.env.PORT || 3000)