var express = require('express');
const path = require('path');
var app = express();

app.use(express.static('public'));

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname, '/html/index.html'));
});

app.get('/html/video1.html', function(req, res) {
  res.sendFile(path.join(__dirname, '/html/video1.html'));
});

app.get('/html/video2.html', function(req, res) {
  res.sendFile(path.join(__dirname, '/html/video2.html'));
});

app.get('/html/video3.html', function(req, res) {
  res.sendFile(path.join(__dirname, '/html/video3.html'));
});

app.listen(8081, () =>{
  console.log("Server On!");
});