<template>
    <body class="q-pa-md">
    <header class="clearfix">
      <div id="logo">
        <img src="../../../public/logo.png">
      </div>
      <div id="company">
        <h2 class="name">Medical Hadja</h2>
        <div>455 Bab E-Dhaya, Sidi Bel Abbes, Algérie</div>
        <div>(602) 519-0450</div>
        <div><a href="mailto:contact@MedicalHadja.com">contact@MedicalHadja.com</a></div>
      </div>
    </header>
    <main>
      <div id="details" class="clearfix">
        <div id="client">
          <div class="to">Facture pour :</div>
          <h2 class="name">Mohamed Flen</h2>
          <div class="address">796 Sidi Djillali, Sidi Bel Abbes, Algérie </div>
          <div class="email"><a href="mailto:mohamed@gmail.com">mohamed@gmail.com</a></div>
        </div>
        <div id="invoice">
          <h1>Facture N° 3215648</h1>
          <div class="date">Date de la facture: 02/12/2020</div>
          <div class="date">Dernier délai de paiment: 01/01/2021</div>
        </div>
      </div>
      <table border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th class="totale">N° RÉF.</th>
            <th class="desc">DESCRIPTION</th>
            <th class="unit">PRIX UNITAIRE</th>
            <th class="qty">QUANTITÉ</th>
            <th class="total">MONTANT HT</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="totale">01</td>
            <td class="desc"><h3>Chaise Roulante</h3>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum architecto accusantium dolorum sunt.</td>
            <td class="unit">40.00 DA</td>
            <td class="qty">30</td>
            <td class="total">1,200.00 DA</td>
          </tr>
          <tr>
            <td class="totale">02</td>
            <td class="desc"><h3>Béquille</h3>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam illo neque possimus optio distinctio ea.</td>
            <td class="unit">40.00 DA</td>
            <td class="qty">80</td>
            <td class="total">3,200.00 DA</td>
          </tr>
          <tr>
            <td class="totale">03</td>
            <td class="desc"><h3>Bavettes</h3>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam illo neque possimus optio distinctio ea.</td>
            <td class="unit">40.00 DA</td>
            <td class="qty">20</td>
            <td class="total">800.00 DA</td>
          </tr>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="2"></td>
            <td colspan="2">TOTAL HT</td>
            <td>5,200.00 DA</td>
          </tr>
          <tr>
            <td colspan="2"></td>
            <td colspan="2">TVA 19%</td>
            <td>1,300.00 DA</td>
          </tr>
          <tr>
            <td colspan="2"></td>
            <td colspan="2">TOTAL TTC</td>
            <td>6,500.00 DA</td>
          </tr>
        </tfoot>
      </table>
      <div id="thanks">Merci !</div>
      <div id="notices">
        <div>Remarque:</div>
        <div class="notice">Une charge financière de 1,5% sera prélevée sur les soldes impayés après 30 jours.</div>
      </div>
    </main>
    <q-page-sticky id="printPageButton" position="top-left" class="q-pa-xs" :offset="[18, 18]">
      <q-btn fab icon="west"  @click="$router.push({name: 'InvoiceHistory'})"  color="blue-grey-5" ><q-tooltip anchor="top middle">Retour</q-tooltip></q-btn>
    </q-page-sticky>
    <q-page-sticky id="printPageButton" position="top-right" class="q-pa-xs" :offset="[18, 18]">
      <q-btn fab icon="print" @click="printili()"  color="blue-grey-5" ><q-tooltip anchor="top middle">Imprimer</q-tooltip></q-btn>
    </q-page-sticky>
  </body>
</template>

<script>
export default {
    data(){
        return{
            hi: ''
        }
    },
    methods:{
        printili(){
            window.print();
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

a {
  color: #0087C3;
  text-decoration: none;
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

header {
  padding: 10px 0;
  margin-bottom: 20px;
  border-bottom: 1px solid #AAAAAA;
}

#logo {
  float: left;
  margin-top: 8px;
}

#logo img {
  height: 70px;
}

#company {
  float: right;
  text-align: right;
}


#details {
  margin-bottom: 50px;
}

#client {
  padding-left: 6px;
  border-left: 6px solid #0087C3;
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
  color: #777777;
}

table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  margin-bottom: 20px;
}

table th,
table td {
  padding: 10px;
  background: #EEEEEE;
  text-align: center;
  border-bottom: 1px solid #FFFFFF;
}

table th {
  white-space: nowrap;        
  font-weight: normal;
}

table td {
  text-align: right;
}

table td h3{
  color: #57B223;
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
  background: #57B223;
  color: #FFFFFF;
}
table .totale {
  background: #57B223;
  color: #FFFFFF;
  text-align: center;

}
table td.unit,
table td.qty,
table td.total {
  font-size: 1.2em;
}

table tbody tr:last-child td {
  border: none;
}

table tfoot td {
  padding: 10px 20px;
  background: #FFFFFF;
  border-bottom: none;
  font-size: 1.2em;
  white-space: nowrap; 
  border-top: 1px solid #AAAAAA; 
}

table tfoot tr:first-child td {
  border-top: none; 
}

table tfoot tr:last-child td {
  color: #57B223;
  font-size: 1.4em;
  border-top: 1px solid #57B223; 

}

table tfoot tr td:first-child {
  border: none;
}

#thanks{
  font-size: 2em;
  margin-bottom: 20px;
}

#notices{
  padding-left: 6px;
  border-left: 6px solid #0087C3;  
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