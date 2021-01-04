const mysql = require('mysql');
const express = require('express');
const Router = express.Router();
const mysqlConnection = require('../connect'); 
var fs  = require('fs');


// Gestion des produits

// Renvoyer la liste des devis
Router.get('/devis',(req,res)=>{
    mysqlConnection.query('SELECT devis_facture.Tva as Tva,devis_facture.datee as datee, devis_facture.Annee as Annee,devis_facture.etat as etat,devis_facture.ID as idfact,devis_facture.montant_total as montant, dossier.*  FROM devis_facture,dossier,achat WHERE dossier.ID = devis_facture.foreignID AND devis_facture.ID = achat.id_fact GROUP BY devis_facture.ID ORDER BY devis_facture.ID  DESC',(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
 
// Renvoyer la liste des factures
Router.get('/',(req,res)=>{
    mysqlConnection.query('SELECT devis_facture.Tva as Tva, devis_facture.datee as datee, devis_facture.Annee as Annee,devis_facture.etat as etat,devis_facture.ID as idfact,devis_facture.montant_total as montant, dossier.*   FROM devis_facture,dossier,achat WHERE dossier.ID = devis_facture.foreignID AND devis_facture.ID = achat.id_fact AND devis_facture.etat = ? GROUP BY devis_facture.ID ORDER BY devis_facture.ID  DESC',['finalisé'],(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
// Renvoyer la liste une seule facture
Router.get('/:id',(req,res)=>{
    mysqlConnection.query('SELECT devis_facture.Tva as Tva, devis_facture.etat as etat, devis_facture.ID as idfact,devis_facture.Annee as factyear,devis_facture.montant_total as montants,devis_facture.remise as remise, patient_nom,patient_prenom,patient_datenaiss,patient_lieunaiss, dossier.*, achat.*,produits.*, achat.quantity as quantities  FROM devis_facture,dossier,achat,produits WHERE dossier.ID = devis_facture.foreignID AND devis_facture.ID = achat.id_fact AND devis_facture.ID = ? AND produits.NumRef = achat.id_produit',[req.params.id],(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
 

 // Modifier les informations du magasin
Router.patch('/modify',(req,res)=>{
    mysqlConnection.query('UPDATE companyinfo SET NumRegistreComm=?,NumArtImp=?,NumIdFisc=? ,TelOne=? ,TelTwo=?  WHERE Id=?',[req.body.NumRegistreComm,req.body.NumArtImp,req.body.NumIdFisc,req.body.TelOne,req.body.TelTwo,req.body.Id],(err,rows,fields)=>{
        if(!err)
        res.json(rows);
        else
        console.log(err);
    })
});

 // Ajouter un devis 
Router.post('/',(req,res)=>{
    var montanttotal = 0;
    for(var k=0; k < req.body.commande.length; k++) {
        montanttotal = montanttotal + req.body.commande[k].PrixU*req.body.commande[k].quantity
    }
    montanttotal = montanttotal - ((montanttotal * req.body.remise)/100)
    var x =  Math.floor(Math.random() * Math.floor(10000))
    var yearr  = new Date().getFullYear()
    
                if(req.body.id === 1){
                    
    mysqlConnection.query('SELECT * from dossier WHERE NumTel = ?',[req.body.numtel],(err,rows,fields)=>{
        if(err){
            console.log(err);
        }else {

            if (rows && rows.length ) {
                
                return res.status('406').send({ message: 'numero kayen deja' });
                // do something with your row variable
        }else { // 
            mysqlConnection.query('INSERT INTO dossier (nom, prenom, NumSecSocial, NumTel, Caisse, Wilaya, year,identifier) VALUES(?,?,?,?,?,?,?,?)',[req.body.nom,req.body.prenom,req.body.numsecsocial,req.body.numtel,req.body.caisse,req.body.wilaya,yearr,x],(err,rows,fields)=>{
                if(!err) {
                mysqlConnection.query('INSERT INTO devis_facture (Annee, foreignID,datee, foreignyear, patient_nom, patient_prenom, patient_datenaiss, patient_lieunaiss, etat,remise, montant_total, Tva,identifier) VALUES (?,(Select ID from dossier where identifier = ? ),curdate(),(Select year from dossier where NumTel = ? ),?,?,?,?,?,?,?,?,?)',[yearr,x,req.body.numtel,req.body.patientnom,req.body.patientprenom,req.body.patientdatenaiss,req.body.patientlieunaiss,'non-finalisé',req.body.remise,montanttotal,req.body.tva,x],(err,rows,fields)=>{
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
                        mysqlConnection.query('UPDATE dossier SET identifier=? WHERE identifier=?',[0,x],(err,rows,fields)=>{
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
        }
            } 
        });
                   
                }else {
                    mysqlConnection.query('UPDATE dossier SET NumTel=? WHERE ID=?',[req.body.numtel,req.body.id],(err,rows,fields)=>{
                        if(err)
                        console.log(err);
                    })
                    mysqlConnection.query('INSERT INTO devis_facture (Annee, foreignID,datee, foreignyear, patient_nom, patient_prenom, patient_datenaiss, patient_lieunaiss, etat, montant_total, Tva, identifier) VALUES (?,? ,curdate(),(Select year from dossier where NumTel = ? ),?,?,?,?,?,?,?,?)',[yearr,req.body.id,req.body.numtel,req.body.patientnom,req.body.patientprenom,req.body.patientdatenaiss,req.body.patientlieunaiss,'non-finalisé',montanttotal,req.body.tva, x],(err,rows,fields)=>{
                        if(!err){
                            for(var k=0; k < req.body.commande.length; k++) {
                                mysqlConnection.query('INSERT INTO achat (id_fact,id_produit,quantity,montant,price) VALUES ((Select ID from devis_facture where identifier = ? ),?,?,?,?)',[x,req.body.commande[k].NumRef,req.body.commande[k].quantity,req.body.commande[k].PrixU,req.body.commande[k].PrixU],(err,rows,fields)=>{
                                    if(err){
                                        console.log(err);
                                       }
                                })
                            }
                            mysqlConnection.query('UPDATE dossier SET identifier=? WHERE identifier=?',[0,x],(err,rows,fields)=>{
                                if(err)
                                console.log(err);
                            });
                            res.send(rows);
                        }
                        else
                        console.log(err);
                    })
                }

});

 // Supprimer un devis
 Router.delete('/devis/:id',(req,res)=>{
    mysqlConnection.query('DELETE d,p FROM devis_facture d JOIN achat p ON d.ID = p.id_fact WHERE d.ID = ? ',[req.params.id],(err,rows,fields)=>{
        if(!err)
        res.send(rows)
        else
        console.log(err);
    })
});


  // Rechercher une facture
  Router.post('/recherche',(req,res)=>{
    mysqlConnection.query('SELECT devis_facture.Tva as Tva,devis_facture.datee as datee, devis_facture.Annee as Annee,devis_facture.etat as etat,devis_facture.ID as idfact,devis_facture.montant_total as montant, dossier.*  FROM devis_facture,dossier  WHERE (dossier.nom LIKE ? OR dossier.prenom LIKE ? OR dossier.NumTel LIKE ? ) AND dossier.ID = devis_facture.foreignID AND devis_facture.etat = ?',[req.body.Search,req.body.Search,req.body.Search,'finalisé'],(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
  // Rechercher un devis
  Router.post('/recherche/devis',(req,res)=>{
    mysqlConnection.query('SELECT devis_facture.Tva as Tva,devis_facture.datee as datee, devis_facture.Annee as Annee,devis_facture.etat as etat,devis_facture.ID as idfact,devis_facture.montant_total as montant, dossier.*  FROM devis_facture,dossier  WHERE (dossier.nom LIKE ? OR dossier.prenom LIKE ? OR dossier.NumTel LIKE ? ) AND dossier.ID = devis_facture.foreignID',[req.body.Search,req.body.Search,req.body.Search],(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
  // finaliser le devis
Router.patch('/finaliser',(req,res)=>{
    mysqlConnection.query('UPDATE devis_facture SET etat=?  WHERE ID=?',['finalisé',req.body.Id],(err,rows,fields)=>{
        if(!err)
        res.json(rows);
        else
        console.log(err);
    })
});
module.exports = Router;