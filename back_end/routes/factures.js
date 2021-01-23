const mysql = require('mysql');
const express = require('express');
const Router = express.Router();
const mysqlConnection = require('../connect'); 
var fs  = require('fs');


// Gestion des produits

// Renvoyer la liste des devis
Router.get('/devis',(req,res)=>{
    mysqlConnection.query('SELECT devis_facture.date_delivery as date_delivery, devis_facture.date_cree as date_cree,devis_facture.Caisse as Caissee,devis_facture.Tva as Tva,devis_facture.datee as datee, devis_facture.Annee as Annee,devis_facture.etat as etat,devis_facture.ID as idfact,devis_facture.montant_total as montant, dossier.*  FROM devis_facture,dossier,achat WHERE dossier.ID = devis_facture.foreignID AND devis_facture.ID = achat.id_fact GROUP BY devis_facture.ID ORDER BY devis_facture.ID  DESC limit 20',(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
 
// Renvoyer la liste des devis cash (jdida) 
Router.get('/devis/cash',(req,res)=>{
    mysqlConnection.query('SELECT devis_berk.date_delivery as date_delivery, devis_berk.date_cree as date_cree, devis_berk.Caisse as Caissee,devis_berk.Tva as Tva,devis_berk.datee as datee, devis_berk.Annee as Annee,devis_berk.etat as etat,devis_berk.ID as idfact,devis_berk.montant_total as montant, dossier.*  FROM devis_berk,dossier,achatdevis WHERE dossier.ID = devis_berk.foreignID AND devis_berk.ID = achatdevis.id_fact GROUP BY devis_berk.ID ORDER BY devis_berk.ID  DESC limit 20',(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
// Renvoyer la liste des factures
Router.get('/',(req,res)=>{
    mysqlConnection.query('SELECT devis_facture.Caisse as Caissee,devis_facture.Tva as Tva, devis_facture.datee as datee, devis_facture.Annee as Annee,devis_facture.etat as etat,devis_facture.ID as idfact,devis_facture.montant_total as montant, dossier.*   FROM devis_facture,dossier,achat WHERE dossier.ID = devis_facture.foreignID AND devis_facture.ID = achat.id_fact AND devis_facture.etat = ? GROUP BY devis_facture.ID ORDER BY devis_facture.ID  DESC limit 20',['finalisé'],(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
// Renvoyer la liste une seule facture tbadlet
Router.get('/:id/:caisse',(req,res)=>{
    if(req.params.caisse === 'CASH'){
        mysqlConnection.query('SELECT  devis_berk.date_cree as date_cree, devis_berk.date_delivery as date_delivery,   devis_berk.ID_seyed as ID_seyed, devis_berk.Nom_Prenom as Nom_prenom,  devis_berk.TTConly as TTConly, devis_berk.TVAonly as TVAonly, devis_berk.Remiseonly as Remiseonly,  devis_berk.Wilaya as Wilayaa,devis_berk.Caisse as Caissee,devis_berk.Numsecsocial as Numsecsocial,devis_berk.montant_TTC as montant_TTC,devis_berk.Cash as Cash,devis_berk.Tva as Tva, devis_berk.etat as etat, devis_berk.ID as idfact,devis_berk.Annee as factyear,devis_berk.montant_total as montants,devis_berk.remise as remise, patient_nom,patient_prenom,patient_datenaiss,patient_lieunaiss, dossier.*, achatdevis.*,produits.*, achatdevis.quantity as quantities  FROM devis_berk,dossier,achatdevis,produits WHERE dossier.ID = devis_berk.foreignID AND devis_berk.ID = achatdevis.id_fact AND devis_berk.ID = ? AND produits.NumRef = achatdevis.id_produit',[req.params.id],(err,rows,fields)=>{
            if(!err)
            res.send(rows);
            else
            console.log(err);
        })}else{
            mysqlConnection.query('SELECT devis_berk.date_cree as date_cree, devis_berk.date_delivery as date_delivery, devis_facture.ID_seyed as ID_seyed, devis_facture.Nom_Prenom as Nom_prenom,  devis_facture.TTConly as TTConly, devis_facture.TVAonly as TVAonly, devis_facture.Remiseonly as Remiseonly,  devis_facture.Wilaya as Wilayaa,devis_facture.Caisse as Caissee,devis_facture.Numsecsocial as Numsecsocial,devis_facture.montant_TTC as montant_TTC,devis_facture.Cash as Cash,devis_facture.Tva as Tva, devis_facture.etat as etat, devis_facture.ID as idfact,devis_facture.Annee as factyear,devis_facture.montant_total as montants,devis_facture.remise as remise, patient_nom,patient_prenom,patient_datenaiss,patient_lieunaiss, dossier.*, achat.*,produits.*, achat.quantity as quantities  FROM devis_facture,dossier,achat,produits WHERE dossier.ID = devis_facture.foreignID AND devis_facture.ID = achat.id_fact AND devis_facture.ID = ? AND produits.NumRef = achat.id_produit',[req.params.id],(err,rows,fields)=>{
                if(!err)
                res.send(rows);
                else
                console.log(err);
            })}
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
// Remiseonly TVAonly
 // Ajouter un devis tbadlet
Router.post('/',(req,res)=>{
    var montanttotal = 0.00;
    var montantttc = 0;
    for(var k=0; k < req.body.commande.length; k++) {
        montanttotal = montanttotal + (req.body.commande[k].PrixU * req.body.commande[k].quantity)
        montantttc = montantttc + (req.body.commande[k].PrixU + ((req.body.commande[k].PrixU * req.body.commande[k].tax * req.body.tva )/100))*req.body.commande[k].quantity
    }
    // remiseonly hiya ch7al rayhin na9so en prix
    Remiseonly = (montanttotal * req.body.remise)/100
    // Tvaonly hiya ch7al nzido tax en prix
    TVAonly = ((montanttotal - Remiseonly) * req.body.tva * req.body.commande[0].tax)/100
    // ttconly hiya kolech bl tva lkkolech
    TTConly = montanttotal - Remiseonly + TVAonly
    var x =  Math.floor(Math.random() * Math.floor(10000))
 
    var datecree = new Date();
    var datecreee = datecree.getFullYear()+'-'+(datecree.getMonth()+1)+'-'+datecree.getDate();
    
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
                    if(req.body.caisse === 'CASH'){
                        mysqlConnection.query('INSERT INTO devis_berk (Annee, foreignID,datee, foreignyear,Numsecsocial, Caisse, Wilaya, patient_nom, patient_prenom, patient_datenaiss, patient_lieunaiss, etat,remise, montant_total, montant_TTC, Tva,Cash,identifier,Remiseonly, TVAonly, TTConly,date_cree) VALUES (?,(Select ID from dossier where identifier = ? ),curdate(),(Select year from dossier where NumTel = ? ),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',[yearr,x,req.body.numtel,req.body.numsecsocial,req.body.caisse,req.body.wilaya,req.body.patientnom,req.body.patientprenom,req.body.patientdatenaiss,req.body.patientlieunaiss,'non-finalisé',req.body.remise,montanttotal,montantttc,req.body.tva,req.body.cash,x, Remiseonly, TVAonly,TTConly,datecreee],(err,rows,fields)=>{
                            if(!err){
                                for(var k=0; k < req.body.commande.length; k++) {
                                    mysqlConnection.query('INSERT INTO achatdevis (id_fact,id_produit,quantity,montant,price,tax) VALUES ((Select ID from devis_berk where identifier = ? ),?,?,?,?,?)',[x,req.body.commande[k].NumRef,req.body.commande[k].quantity,req.body.commande[k].PrixU,req.body.commande[k].PrixU,req.body.commande[k].tax],(err,rows,fields)=>{
                                        if(err){
                                            console.log(err);
                                           }
                                    })
                                }
                                mysqlConnection.query('UPDATE devis_berk SET identifier=? WHERE identifier=?',[0,x],(err,rows,fields)=>{
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
                        })

                    }else{
                        mysqlConnection.query('INSERT INTO devis_facture (Annee, foreignID,datee, foreignyear,Numsecsocial, Caisse, Wilaya, patient_nom, patient_prenom, patient_datenaiss, patient_lieunaiss, etat,remise, montant_total, montant_TTC, Tva,Cash,identifier,Remiseonly, TVAonly, TTConly,date_cree) VALUES (?,(Select ID from dossier where identifier = ? ),curdate(),(Select year from dossier where NumTel = ? ),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',[yearr,x,req.body.numtel,req.body.numsecsocial,req.body.caisse,req.body.wilaya,req.body.patientnom,req.body.patientprenom,req.body.patientdatenaiss,req.body.patientlieunaiss,'non-finalisé',req.body.remise,montanttotal,montantttc,req.body.tva,req.body.cash,x, Remiseonly, TVAonly,TTConly,datecreee],(err,rows,fields)=>{
                            if(!err){
                                for(var k=0; k < req.body.commande.length; k++) {
                                    mysqlConnection.query('INSERT INTO achat (id_fact,id_produit,quantity,montant,price,tax) VALUES ((Select ID from devis_facture where identifier = ? ),?,?,?,?,?)',[x,req.body.commande[k].NumRef,req.body.commande[k].quantity,req.body.commande[k].PrixU,req.body.commande[k].PrixU,req.body.commande[k].tax],(err,rows,fields)=>{
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
            }
                else
                console.log(err);
            })
        }
            } 
        });
        
                }else {
                    mysqlConnection.query('UPDATE dossier SET NumTel=?, NumSecSocial=?,Caisse=?, Wilaya=?  WHERE ID=?',[req.body.numtel,req.body.numsecsocial,req.body.caisse,req.body.wilaya,req.body.id],(err,rows,fields)=>{
                        if(err)
                        console.log(err);
                    })
                    if(req.body.caisse === 'CASH'){
                        
                    mysqlConnection.query('INSERT INTO devis_berk (Annee, foreignID,datee, foreignyear,Numsecsocial, Caisse, Wilaya, patient_nom, patient_prenom, patient_datenaiss, patient_lieunaiss, etat,remise, montant_total, montant_TTC, Tva,Cash, identifier, Remiseonly, TVAonly, TTConly, date_cree) VALUES (?,? ,curdate(),(Select year from dossier where NumTel = ? ),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',[yearr,req.body.id,req.body.numtel,req.body.numsecsocial,req.body.caisse,req.body.wilaya,req.body.patientnom,req.body.patientprenom,req.body.patientdatenaiss,req.body.patientlieunaiss,'non-finalisé',req.body.remise,montanttotal,montantttc,req.body.tva,req.body.cash, x, Remiseonly, TVAonly, TTConly, datecreee],(err,rows,fields)=>{
                        if(!err){
                            for(var k=0; k < req.body.commande.length; k++) {
                                mysqlConnection.query('INSERT INTO achatdevis (id_fact,id_produit,quantity,montant,price,tax) VALUES ((Select ID from devis_berk where identifier = ? ),?,?,?,?,?)',[x,req.body.commande[k].NumRef,req.body.commande[k].quantity,req.body.commande[k].PrixU,req.body.commande[k].PrixU,req.body.commande[k].tax],(err,rows,fields)=>{
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
                    }else{
                        mysqlConnection.query('INSERT INTO devis_facture (Annee, foreignID,datee, foreignyear,Numsecsocial, Caisse, Wilaya, patient_nom, patient_prenom, patient_datenaiss, patient_lieunaiss, etat,remise, montant_total, montant_TTC, Tva,Cash, identifier, Remiseonly, TVAonly, TTConly, date_cree) VALUES (?,? ,curdate(),(Select year from dossier where NumTel = ? ),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',[yearr,req.body.id,req.body.numtel,req.body.numsecsocial,req.body.caisse,req.body.wilaya,req.body.patientnom,req.body.patientprenom,req.body.patientdatenaiss,req.body.patientlieunaiss,'non-finalisé',req.body.remise,montanttotal,montantttc,req.body.tva,req.body.cash, x, Remiseonly, TVAonly, TTConly, datecreee],(err,rows,fields)=>{
                            if(!err){
                                for(var k=0; k < req.body.commande.length; k++) {
                                    mysqlConnection.query('INSERT INTO achat (id_fact,id_produit,quantity,montant,price,tax) VALUES ((Select ID from devis_facture where identifier = ? ),?,?,?,?,?)',[x,req.body.commande[k].NumRef,req.body.commande[k].quantity,req.body.commande[k].PrixU,req.body.commande[k].PrixU,req.body.commande[k].tax],(err,rows,fields)=>{
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
                        })}
                }

});

 // Supprimer un devis tbadlet
 Router.delete('/devis/:id/:caisse',(req,res)=>{
     if(req.params.caisse === 'CASH'){
        mysqlConnection.query('DELETE d,p FROM devis_berk d JOIN achatdevis p ON d.ID = p.id_fact WHERE d.ID = ? ',[req.params.id],(err,rows,fields)=>{
            if(!err)
            res.send(rows)
            else
            console.log(err);
        })}else{
            mysqlConnection.query('DELETE d,p FROM devis_facture d JOIN achat p ON d.ID = p.id_fact WHERE d.ID = ? ',[req.params.id],(err,rows,fields)=>{
                if(!err)
                res.send(rows)
                else
                console.log(err);
            })}
});


  // Rechercher une facture
  Router.post('/recherche',(req,res)=>{
    mysqlConnection.query('SELECT devis_facture.Tva as Tva,devis_facture.datee as datee, devis_facture.Annee as Annee,devis_facture.etat as etat,devis_facture.ID as idfact,devis_facture.montant_total as montant, dossier.*  FROM devis_facture,dossier  WHERE (dossier.nom LIKE ? OR dossier.prenom LIKE ? OR dossier.NumTel LIKE ? ) AND dossier.ID = devis_facture.foreignID AND devis_facture.etat = ? limit 20',[req.body.Search,req.body.Search,req.body.Search,'finalisé'],(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
  // Rechercher un devis
  Router.post('/recherche/devis',(req,res)=>{
    mysqlConnection.query('SELECT devis_facture.Tva as Tva,devis_facture.datee as datee, devis_facture.Annee as Annee,devis_facture.etat as etat,devis_facture.ID as idfact,devis_facture.montant_total as montant, dossier.*  FROM devis_facture,dossier  WHERE (dossier.nom LIKE ? OR dossier.prenom LIKE ? OR dossier.NumTel LIKE ? ) AND dossier.ID = devis_facture.foreignID limit 20',[req.body.Search,req.body.Search,req.body.Search],(err,rows,fields)=>{
        if(!err)
        res.send(rows);
        else
        console.log(err);
    })
 });
  // finaliser le devis tbadlet
Router.patch('/finaliser',(req,res)=>{
    if(req.body.caisse === 'CASH'){
        mysqlConnection.query('UPDATE devis_berk SET etat=?, ID_seyed= ?, Nom_Prenom = ?, date_delivery = STR_TO_DATE(?, "%d-%m-%Y")    WHERE ID=?',['finalisé',req.body.ID_seyed,req.body.Nom_Prenom,req.body.date_delivery,req.body.Id],(err,rows,fields)=>{
            if(!err)
            res.json(rows);
            else
            console.log(err);
        })
    }else{
        mysqlConnection.query('UPDATE devis_facture SET etat=?, ID_seyed= ?, Nom_Prenom = ?, date_delivery = STR_TO_DATE(?, "%d-%m-%Y")     WHERE ID=?',['finalisé',req.body.ID_seyed,req.body.Nom_Prenom,req.body.date_delivery,req.body.Id],(err,rows,fields)=>{
            if(!err)
            res.json(rows);
            else
            console.log(err);
        })}
});
module.exports = Router;