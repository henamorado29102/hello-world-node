const express = require('express')
const app = express()

app.use(express.static('public'));


app.get('/', function (req, res) {
  res.sendFile(__dirname + '/views/index.html');
})

app.get('/report', function (req, res) {
  res.sendFile(__dirname + '/views/report.html');
})
app.listen(3000)
