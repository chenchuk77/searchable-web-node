var express = require('express');
var app = express();

//setting middleware

var public_folder = __dirname + '/public';
console.log("serving: " + public_folder);

app.use(express.static(public_folder)); //Serves resources from public folder

var server = app.listen(8080);

// populate matkonims list from files in public folder
var makonims = [];
const matkonimFolder = './public/';
const fs = require('fs');
fs.readdir(matkonimFolder, (err, files) => {
  files.forEach(file => {
    console.log(file);
    var filename = file.split(".html")[0];
    makonims.push(filename);
  });
});

// expose matkonims for client side processing
app.get('/list', (req, res) => {
    res.json({ matkonims: makonims });
});

