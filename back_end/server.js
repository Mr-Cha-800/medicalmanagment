const mysql = require('mysql');
const express = require('express');
const produits = require('./routes/produits');
const bodyparser = require('body-parser');
const mysqlConnection = require('./connect'); 

var app = express();
app.use(bodyparser.json());

app.use('/produits',produits);




app.listen(3000);