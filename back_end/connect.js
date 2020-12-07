const mysql = require('mysql');

// Établir la connexion avec la base de données
var mysqlConnection = mysql.createConnection({
    host:'127.0.0.1',
    user: 'root',
    password: 'iPhond2020',
    database: 'medical',
    multipleStatements: true
});


mysqlConnection.connect((err)=>{
    if(!err)
    console.log('Success');
    else
    console.log('Fail \n '+JSON.stringify(err,undefined,2));
});

module.exports = mysqlConnection;