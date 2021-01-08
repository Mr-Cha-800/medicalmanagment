const mysql = require('mysql');
const express = require('express');
const Router = express.Router();
const mysqlConnection = require('../connect'); 

var exec = require('child_process').exec;
// Gestion des produits

Router.post('/save',(req,res)=>{
    let date_ob = new Date();

// adjust 0 before single digit date
let date = ("0" + date_ob.getDate()).slice(-2);

// current month
let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);

// current year
let year = date_ob.getFullYear();

// prints date in YYYY-MM-DD format
var my_date = year + "-" + month + "-" + date;
    var exec = require('child_process').exec;
    var child = exec(" mysqldump -u root -p'' medical > "+ req.body.chemin +"/"+my_date+"medical.sql");
    return res.status('200').send({ message: 'nice'});
 });
// Renvoyer la liste des produits
Router.get('/',(req,res)=>{
    mysqlConnection.query('SELECT * FROM companyinfo',(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
 

 // Modifier les informations d'un produit 
Router.patch('/modify',(req,res)=>{
    mysqlConnection.query('UPDATE companyinfo SET NumRegistreComm=?,NumArtImp=?,NumIdFisc=? ,Tva = ? ,TelOne=? ,TelTwo=?  WHERE Id=?',[req.body.NumRegistreComm,req.body.NumArtImp,req.body.NumIdFisc,req.body.Tva,req.body.TelOne,req.body.TelTwo,req.body.Id],(err,rows,fields)=>{
        if(!err)
        res.json(rows);
        else
        console.log(err);
    })
});

  // Rechercher un utilisateur
  Router.post('/recherche',(req,res)=>{
    mysqlConnection.query('SELECT * from dossier WHERE ID LIKE ? OR nom LIKE ? OR prenom LIKE ? OR NumTel LIKE ? OR NumSecSocial LIKE ? limit 20',[req.body.Search,req.body.Search,req.body.Search,req.body.Search,req.body.Search],(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
 

module.exports = Router;