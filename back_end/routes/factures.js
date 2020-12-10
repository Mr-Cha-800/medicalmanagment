const mysql = require('mysql');
const express = require('express');
const Router = express.Router();
const mysqlConnection = require('../connect'); 


// Gestion des produits

// Renvoyer la liste des produits
Router.get('/',(req,res)=>{
    mysqlConnection.query('SELECT devis_facture.ID as idfact,devis_facture.montant_total as montant, dossier.*  FROM devis_facture,dossier,achat WHERE dossier.ID = devis_facture.foreignID AND devis_facture.ID = achat.id_fact GROUP BY devis_facture.ID',(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
 

 // Modifier les informations d'un produit 
Router.patch('/modify',(req,res)=>{
    mysqlConnection.query('UPDATE companyinfo SET NumRegistreComm=?,NumArtImp=?,NumIdFisc=? ,TelOne=? ,TelTwo=?  WHERE Id=?',[req.body.NumRegistreComm,req.body.NumArtImp,req.body.NumIdFisc,req.body.TelOne,req.body.TelTwo,req.body.Id],(err,rows,fields)=>{
        if(!err)
        res.json(rows);
        else
        console.log(err);
    })
});

 // Ajouter un nouveau produit
Router.post('/',(req,res)=>{
    var montanttotal = 0;
    for(var k=0; k < req.body.commande.length; k++) {
        montanttotal = montanttotal + req.body.commande[k].PrixU*req.body.commande[k].quantity
    }
    var x =  Math.floor(Math.random() * Math.floor(10000))
    var yearr  = new Date().getFullYear()
    mysqlConnection.query('INSERT INTO dossier (nom, prenom, NumSecSocial, NumTel, Caisse, Wilaya, year) VALUES(?,?,?,?,?,?,?)',[req.body.nom,req.body.prenom,req.body.numsecsocial,req.body.numtel,req.body.caisse,req.body.wilaya,yearr],(err,rows,fields)=>{
        if(!err) {
        mysqlConnection.query('INSERT INTO devis_facture (Annee, foreignID, foreignyear, patient_nom, patient_prenom, patient_datenaiss, patient_lieunaiss, etat, montant_total, identifier) VALUES (?,(Select ID from dossier where NumTel = ? ),(Select year from dossier where NumTel = ? ),?,?,?,?,?,?,?)',[yearr,req.body.numtel,req.body.numtel,req.body.patientnom,req.body.patientprenom,req.body.patientdatenaiss,req.body.patientlieunaiss,'devis',montanttotal,x],(err,rows,fields)=>{
            if(!err){
                for(var k=0; k < req.body.commande.length; k++) {
                    mysqlConnection.query('INSERT INTO achat (id_fact,id_produit,quantity,montant,price) VALUES ((Select ID from devis_facture where identifier = ? ),?,?,?,?)',[x,req.body.commande[k].NumRef,req.body.commande[k].quantity,req.body.commande[k].PrixU,req.body.commande[k].PrixU],(err,rows,fields)=>{
                        if(err){
                            console.log(err);
                           }
                    })
                }
                mysqlConnection.query('UPDATE devis_facture SET identifier=? WHERE identifier=?',[0,x],(err,rows,fields)=>{
                    if(err)
                    console.log(err);
                });
                res.send(rows);
            }
            else
            console.log(err);
        })}
        else
        console.log(err);
    })
});


module.exports = Router;