const mysql = require('mysql');
const express = require('express');
const Router = express.Router();
const mysqlConnection = require('../connect'); 


// Gestion des produits

// Renvoyer la liste des produits
Router.get('/',(req,res)=>{
    mysqlConnection.query('SELECT * FROM produits',(err,rows,fields)=>{
        if(!err)
        res.send(rows)
        else
        console.log(err);
    })
 });
 
 
 // Renvoyer les informations d'un seul produit
 Router.get('/:id',(req,res)=>{
     mysqlConnection.query('SELECT * FROM produits WHERE NumRef = ? ',[req.params.id],(err,rows,fields)=>{
         if(!err)
         res.send(rows)
         else
         console.log(err);
     })
 });

 // Rechercher un produit
 Router.post('/recherche',(req,res)=>{
     mysqlConnection.query('SELECT * FROM produits WHERE DesignationLIKE')
 });
 // Ajouter un nouveau produit
 Router.post('/',(req,res)=>{
     mysqlConnection.query('INSERT INTO produits VALUES(?,?,?)',[req.body.NumRef,req.body.Designation,req.body.PrixU],(err,rows,fields)=>{
         if(!err)
         res.json(rows);
         else
         console.log(err);
     })
 });
 
 // Modifier les informations d'un produit 
Router.patch('/:id',(req,res)=>{
    mysqlConnection.query('UPDATE produits SET Designation=?,PrixU=? WHERE NumRef=?',[req.body.Designation,req.body.PrixU,req.params.id],(err,rows,fields)=>{
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