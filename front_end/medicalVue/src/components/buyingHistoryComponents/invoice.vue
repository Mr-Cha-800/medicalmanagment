<template>
    <body class="q-pa-md">
    <header class="clearfix">
      <div id="logo">
        <img src="../../../public/logo.png">
      </div>
      <div id="company">
        <h3 style="font-size:30px"><b>CENTRE D'APPAREILLAGE ORTHOPEDIQUE</b></h3>
        <h2 style="font-size:20px"><i>Agrément ministère de la santé N°332 du 02-02-2020</i></h2>
      </div>
    </header>
    <br>
    <main>
      <div id="details" class="clearfix">
        <div id="client">
          <div><b style="font-size:15px">N° RC : 22/00-0171155A20</b></div>
          <div><b style="font-size:15px">N° Art imp : 2284.4529.401</b></div>
          <div><b style="font-size:15px">NIF : 182224500652142</b></div>
          <div><img class="img" style="width:25px;height:25px" src="../../../public/phone.png" >
              <rect width="50" height="50" style="fill:black;"/>
          <p>
          <b>06 97 07 94 54</b>
          <br>
          <b>07 74 85 40 90</b>
          </p> 
          </div>
        </div>
        <div id="invoice">
          <div><b>Sidi Bel Abbès le 30-11-2020</b></div>
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