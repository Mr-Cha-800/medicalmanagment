const mysql = require('mysql');
const express = require('express');
const Router = express.Router();
const mysqlConnection = require('../connect'); 


// Gestion des produits

// Renvoyer la liste des produits pour commande 
Router.get('/',(req,res)=>{
    mysqlConnection.query('SELECT * FROM produits ORDER BY NumRef DESC',(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
 
// Renvoyer la liste des produits pour gestion
Router.get('/gestion',(req,res)=>{
    mysqlConnection.query('SELECT * FROM produits ORDER BY NumRef DESC limit 20',(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
 
  // Rechercher un produit
  Router.post('/recherche',(req,res)=>{
    mysqlConnection.query('SELECT * FROM produits WHERE NumRef LIKE ? OR Designation LIKE ? limit 20',[req.body.Search,req.body.Search],(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
 
 // Renvoyer les informations d'un seul produit
 Router.get('/:id',(req,res)=>{
     mysqlConnection.query('SELECT * FROM produits WHERE NumRef = ?',[req.params.id],(err,rows,fields)=>{
         if(!err)
         res.send(rows);
         else
         console.log(err);
     })
 });


 // Ajouter un nouveau produit
 Router.post('/',(req,res)=>{
     mysqlConnection.query('INSERT INTO produits VALUES(?,?,?,?,?)',[req.body.NumRef,req.body.Designation,req.body.PrixU,1,req.body.Tva],(err,rows,fields)=>{
         if(!err)
         res.json(rows);
         else
         return res.status('404').send({ message: err.message });
     })
 });
 
 // Modifier les informations d'un produit 
Router.patch('/:id',(req,res)=>{
    mysqlConnection.query('UPDATE produits SET Designation=?,PrixU=?,tax = ? WHERE NumRef=?',[req.body.Designation,req.body.PrixU,req.body.Tva,req.params.id],(err,rows,fields)=>{
        if(!err)
        res.json(rows);
        else
        console.log(err);
    })
});

 // Supprimer un produit
 Router.delete('/:id',(req,res)=>{
     mysqlConnection.query('DELETE FROM produits WHERE NumRef = ? ',[req.params.id],(err,rows,fields)=>{
         if(!err)
         res.send(rows)
         else
         console.log(err);
     })
 });
 
 
 // Gestion des devis 
 
 
 // Gestion des factures
     //app.get('/allorders')
 
 // Gestion des bons de livraison
 
 
 // 

module.exports = Router;