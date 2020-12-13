const mysql = require('mysql');
const express = require('express');
const Router = express.Router();
const mysqlConnection = require('../connect'); 


// Gestion des produits

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
    mysqlConnection.query('SELECT * from dossier WHERE ID LIKE ? OR nom LIKE ? OR prenom LIKE ? OR NumTel LIKE ? OR NumSecSocial LIKE ? ',[req.body.Search,req.body.Search,req.body.Search,req.body.Search,req.body.Search],(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
 

module.exports = Router;