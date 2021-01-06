<!-- A L'IMPREMENTE MAHECH TEMCHIIIIIII AWÉÉÉÉÉÉÉ-->
<template>
    <body   class="q-pl-md q-pr-md q-pb-md">
      <div ref="content">
    <header class="clearfix">
      <div id="logo">
        <img src="../../../public/logo.png">
      </div>
      <div id="company">
        <h3 style="font-size:30px"><b>CENTRE D'APPAREILLAGE ORTHOPEDIQUE</b><br>
        <i style="font-size:20px">Agrément ministère de la santé N°332 du 02-02-2020</i></h3>
      </div>
      <!-- <div id="company">
        <h3 style="font-size:30px"><b>CENTRE D'APPAREILLAGE ORTHOPEDIQUE</b></h3>
        <h2 style="font-size:20px"><i>Agrément ministère de la santé N°332 du 02-02-2020</i></h2>
      </div> -->
    </header>
    <main> 
      <div id="details" class="clearfix">
        <div id="client">
          <div><b style="font-size:15px">N° RC : {{getinfo[0].NumRegistreComm}}</b></div>
          <div><b style="font-size:15px">N° Art imp : {{getinfo[0].NumArtImp}}</b></div>
          <div><b style="font-size:15px">NIF : {{getinfo[0].NumIdFisc}}</b></div>
          <div><div style="float:left;width:20%"><img class="img" style="margin-top:9px;width:25px;height:25px" src="../../../public/phone.png" ></div>
          <div style="margin-left:20%"> <p>
          <b> {{getinfo[0].TelOne}}</b>
          <br>
          <b>{{getinfo[0].TelTwo}} </b>
          </p> </div></div>
        </div>
        <div id="invoice">
          <div><b style="font-size:20px">Sidi Bel Abbès le {{date1 }}</b></div>
        </div>
      </div>
      <table border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th class="facture">BON LIVRAISON N°: {{getorder[0].idfact}}/{{getorder[0].factyear}} </th> <!--hnaya dir variable beh ndiro numéro de facture incrémentable-->
            <th class="dossier">DOSSIER : {{getorder[0].ID}}/{{getorder[0].year}}</th><!--la meme chose hnaya pour le dossier-->
          </tr>
        </thead>
      </table>
      <div>
          <div><b style="font-size:20px">L'ASSURÉ :</b></div>
      </div>
      <table border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th class="desc" colspan="2">NOM ET PRÉNOM : {{getorder[0].nom}}  {{getorder[0].prenom}} </th> <!--hnaya dir variable lel nom wel prénom-->
          </tr>
          <tr>
            <th class="desc">N° SÉCURITÉ SOCIALE : {{getorder[0].NumSecSocial}}</th> <!--hnaya dir variable lel SÉCURITÉ SOCIALE-->
            <th class="desc"> CAISSE : {{getorder[0].Caisse}} {{getorder[0].Wilaya}}</th> <!--hnaya dir variable lel CAISSE-->
          </tr>
        </thead>
      </table>
      <div>
          <div><b style="font-size:20px">PATIENT :</b></div>
      </div>
      <table border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr> 
            <th class="desc" colspan="2">NOM ET PRÉNOM : {{getorder[0].patient_nom}} {{getorder[0].patient_prenom}}</th> <!--hnaya dir variable lel nom wel prénom-->
          </tr>
          <tr>
            <th class="desc">DATE ET LIEU DE NAISSANCE : {{getorder[0].patient_datenaiss}}</th> <!--hnaya dir variable lel DATE DE NAISSANCE-->
            <th class="desc"> À : {{getorder[0].patient_lieunaiss}}</th><!--hnaya dir variable lel LIEU DE NAISSANCE-->
          </tr>
        </thead>
      </table>
        <template v-if="getorder[0].Cash === 0">
      <div>
          <div><b style="font-size:20px">PRODUIT :</b></div>
      </div>
      <table border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th class="totale">N° RÉF.</th>
            <th class="desc">DESCRIPTION</th>
            <th class="unit">PRIX UNITAIRE H.T</th>
            <th class="tva">TVA</th>
            <th class="qty">QUANTITÉ</th>
            <th class="total">PRIX TOTAL</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="produit in getorder" :key="produit.id">
            <td class="totale">{{produit.NumRef}}</td>
            <td class="desc">{{produit.Designation}}</td>
            <td class="unit">{{produit.price}} DA</td>
            <td v-if="produit.tax === 0" class="tva">0 %</td>
            <td v-else>{{getorder[0].Tva}} %</td>
            <td class="qty">{{produit.quantities}}</td>
            <td v-if="produit.tax === 0" class="total">{{produit.quantities* produit.price }} DA</td>
            <td v-else class="total">{{produit.quantities* (produit.price + ((produit.price * getorder[0].Tva)/100))  }} DA</td>
          </tr>

        </tbody>
      </table>
        </template>
        
        <template v-if="getorder[0].Cash === 1">
      <div>
          <div><b style="font-size:20px">PRODUIT :</b></div>
      </div>
      <table border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th class="totale">N° RÉF.</th>
            <th class="desc">DESCRIPTION</th>
            <th class="unit">PRIX UNITAIRE H.T</th>
            <th class="qty">QUANTITÉ</th>
            <th class="total">PRIX TOTAL</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="produit in getorder" :key="produit.id">
            <td class="totale">{{produit.NumRef}}</td>
            <td class="desc">{{produit.Designation}}</td>
            <td class="unit">{{produit.price}} DA</td>
            <td class="qty">{{produit.quantities}}</td>
            <td class="total">{{produit.quantities* produit.price   }} DA</td>
          </tr>

        </tbody>
      </table>
        </template>
    </main>
    
        </div>
    <q-page-sticky id="printPageButton" position="top-left" class="q-pa-xs" :offset="[18, 18]">
      <q-btn fab icon="west"  @click="$router.push({name: 'InvoiceHistory'})"  color="blue-grey-5" ><q-tooltip anchor="top middle">Retour</q-tooltip></q-btn>
    </q-page-sticky>
    <q-page-sticky id="printPageButton" position="top-right" class="q-pa-xs" :offset="[18, 18]">
      <q-btn fab icon="print" @click="printili()"  color="blue-grey-5" ><q-tooltip anchor="top middle">Imprimer</q-tooltip></q-btn>
    </q-page-sticky>
    <q-page-sticky id="printPageButton" position="top-right" style="padding-top:70px" class="q-pa-xs" :offset="[18, 18]">
      <q-btn fab icon="save" @click="saveme(getorder[0].year,getorder[0].ID)"  color="blue-grey-5" ><q-tooltip anchor="top middle">Sauvegarder</q-tooltip></q-btn>
    </q-page-sticky>
    <q-page-sticky id="printPageButton" position="top-right" class="q-pa-xs" :offset="[180, 18]">
      <printactions v-if="getorder[0].etat === 'finalisé'" :id="getorder[0].idfact"/>
      </q-page-sticky>
  </body>
</template>

<script>
var writtenNumber = require('written-number');
import { mapActions, mapGetters } from 'vuex'
import { date } from 'quasar'
import jspdf from 'jspdf'
import domtoimage from 'dom-to-image';
// const fs = require('fs');
let timeStamp = Date.now()
let formattedString = date.formatDate(timeStamp, 'DD-MM-YYYY')
import { NumberToLetter } from 'convertir-nombre-lettre';
import printactions from '../layout/printactions'
export default {
    components:{printactions},
    data(){
        return{
            hi: '',
            date1: formattedString,
            NumberToLetterz: NumberToLetter(20),
            teste: writtenNumber(1234.22, {lang: 'fr'}),
           // nummm: null,
           // nummmm: null
        }
    },
    methods:{
      ...mapActions('company',['setinfo']),
      ...mapActions('order',['setoneorder']),
        printili(){
          window.print()
        },
        
        saveme(year,id){
        domtoimage
        .toPng(this.$refs.content)
        .then(function (dataUrl) {
          var img = new Image();
          img.src = dataUrl;
          var doc = new jspdf("p", "cm", "a5");
          var width = doc.internal.pageSize.getWidth();
          var height = doc.internal.pageSize.getHeight();
          doc.addImage(img, 'PNG', 0.5, 0, width-1, height-2.5);
          const filename = 'Facture' + '.pdf';

          doc.save(`${id}/${year}/${filename}`);
        })
        .catch(function (error) {
          console.error('oops, something went wrong!', error);
        });
        
    },



          /*
          const doc = new jspdf();
          const html = this.$refs.content.innerHTML;

          doc.fromHTML(html,15,15,{
            width:150
          });
          if (!fs.existsSync(`G:/${this.getorder[0].year}/${this.getorder[0].ID}`)){
            fs.mkdirSync(`G:/${this.getorder[0].year}/${this.getorder[0].ID}`, function(err){
              if(!err) {
                   doc.save(`G:/${this.getorder[0].year}/${this.getorder[0].ID}/Facture.pdf`)
              }
            });
          }
        }*/
        
    },
    created(){
      this.setinfo()
      this.setoneorder(this.$route.params.id)
      // this.nummm = NumberToLetter(Math.trunc(((this.getorder[0].montants* this.getorder[0].Tva)/100)+this.getorder[0].montants))
      // this.nummmm = NumberToLetter((((((this.getorder[0].montants* this.getorder[0].Tva)/100)+this.getorder[0].montants) - (Math.trunc(((this.getorder[0].montants* this.getorder[0].Tva)/100)+this.getorder[0].montants))).toFixed(2))*100);
    
    },
    computed:{
      ...mapGetters('company', ['getinfo']),
      ...mapGetters('order', ['getorder']),
      nummm(){
            return NumberToLetter(Math.trunc(this.getorder[0].montants))
      },
      nummmTTC(){
            return NumberToLetter(Math.trunc(this.getorder[0].montant_TTC))
      },
      nummmm(){
          return  NumberToLetter(((((this.getorder[0].montants) - (Math.trunc(this.getorder[0].montants))).toFixed(2))*100).toFixed(2));
      },
      nummmmTTC(){
          return  NumberToLetter(((((this.getorder[0].montant_TTC) - (Math.trunc(this.getorder[0].montant_TTC))).toFixed(2))*100).toFixed(2));
      }
    }
}
</script>

<style lang="scss" scoped>
 @font-face {
  font-family: SourceSansPro;
  src: url('../../../public/SourceSansPro-Regular.ttf');
}


.clearfix:after {
  content: "";
  display: table;
  clear: both;
}

body {
  position: relative;
  width: 21cm;  
  height: 29.7cm; 
  margin: 0 auto; 
  color: #555555;
  background: #FFFFFF; 
  font-family: Arial, sans-serif; 
  font-size: 14px; 
  font-family: SourceSansPro;
}

#logo {
  float: left;
  margin-top: 20px;
}

#logo img {
  height: 70px;
  margin-right: 20px;
}

.img{
    float: left;
    margin-right:1rem;
}

#company {
  float: left;
  text-align: left;
}


#details {
  margin-bottom: 10px;
}

#client {
  padding-left: 6px;
  border-left: 6px;
  float: left;
}

#client .to {
  color: #777777;
}

h2.name {
  font-size: 1.4em;
  font-weight: normal;
  margin: 0;
}

#invoice {
  float: right;
  text-align: right;
}

#invoice h1 {
  color: #0087C3;
  font-size: 2.4em;
  line-height: 1em;
  font-weight: normal;
  margin: 0  0 10px 0;
}

#invoice .date {
  font-size: 1.1em;
  color: #000000;
}

table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  margin-bottom: 10px;
}

table th,
table td {
  padding: 10px;
  background: #EEEEEE;
  text-align: center;
  border-bottom: 1px solid #AAAAAA;
}

table th {
  white-space: nowrap;        
  font-weight: normal;
}

table td {
  text-align: right;
}

table td h3{
  color: #000000;
  font-size: 1.2em;
  font-weight: normal;
  margin: 0 0 0.2em 0;
}

table .no {
  color: #FFFFFF;
  font-size: 1.6em;
  background: #57B223;
}

table .desc {
  text-align: left;
}

table .unit {
  background: #DDDDDD;
}

table .total {
  color: #000000;
}
table .totale {
  color: #000000;
  text-align: center;

}
table td.unit,
table td.qty,
table td.total {
  font-size: 1.2em;
}

// table tbody tr:last-child td {
//   border: none;
// }

table tfoot td {
  padding: 10px 20px;
  background: #FFFFFF;
  border-bottom: none;
  font-size: 1.2em;
  white-space: nowrap; 
  border-top: 1px solid #000000; 
}

table tfoot tr:first-child td {
  border-top: none; 
}

table tfoot tr:last-child td {
  color: #000000;
  font-weight: bold;
  font-size: 1.2em;
  border-top: 1px solid #000000; 
  border-bottom: 1px solid #000000;
}

table tfoot tr td:first-child {
  border: none;
}

#thanks{
  font-size: 1.2em;
  margin-bottom: 10px;
}

#notices .notice {
  font-size: 1.2em;
}

footer {
  color: #777777;
  width: 100%;
  height: 30px;
  position: absolute;
  bottom: 0;
  border-top: 1px solid #AAAAAA;
  padding: 8px 0;
  text-align: center;
}

@media print {
  #printPageButton {
    display: none;
  }
}
</style>