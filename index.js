const express = require('express')
const app = express()

app.get('/', function (req, res) {
  res.send('Hello World!!!')
})

app.get('/second', function (req, res) {
  res.send('add a second end point!!')
})

app.listen(3000)