const mysql = require('mysql');
const express = require('express');
const produits = require('./routes/produits');
const info = require('./routes/info');
const bodyparser = require('body-parser');
const mysqlConnection = require('./connect'); 
var cors = require('cors')


var app = express();
app.use(bodyparser.json());

app.use(cors())

require("./routes")(app)


app.listen(3000);