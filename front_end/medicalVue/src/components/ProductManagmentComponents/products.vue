<template>
  <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Liste des produits</div>
        </q-card-section>

        <q-separator />

        <q-card-actions class="q-pa-xl">
<table>
  <tr>
    <th>N° Réf.</th>
    <th>Désignation</th>
    <th style=width:10%>Prix unitaire</th>
    <th>TVA</th>
    <th style=width:10%>Prix T.T.C</th>
    <th>Modifier</th>
    <th>Supprimer</th>
  </tr>
  <center>
  <template v-if="showstatus">
    <q-spinner-hourglass 
    color="blue-grey-5"
    size="3.5em"/>
  </template>
  </center>
  <tr v-for="product in getproducts" :key="product.id">
    <td>{{product.NumRef}}</td>
    <td>{{product.Designation}}</td>
    <td>{{formatthis(product.PrixU)}} DA</td>
    <td v-if="product.tax === 1">{{getinfo[0].Tva}} %</td>
    <td v-else>{{product.tax}} %</td>
    <td v-if="product.tax === 1">{{formatthis((product.PrixU+((product.PrixU*getinfo[0].Tva)/100)).toFixed(2))}} DA</td>
    <td v-else-if="product.tax === 0">{{formatthis(product.PrixU)}} DA</td>
    <td><q-btn round flat><q-icon color="blue-grey-5"  @click="$router.push({name: 'modifierproduit', params: { id: product.NumRef }})"  name="edit"/><q-tooltip>Modifier</q-tooltip></q-btn></td>
    <td> <supprimer :id="product.NumRef"/> </td>
  </tr>
</table>
        </q-card-actions>
        </q-card>
</template>

<script>
import { mapActions,mapGetters } from 'vuex'
import supprimer from './supprimer'
var numberFormatter = require("number-formatter")

export default {
  components:{ supprimer },
  data(){
    return {
      dialog: false,
      hti: numberFormatter("### ### ###.##", '56789.87')
      }
  },
  methods: {
    ...mapActions('product', ['getallproductsforgestion']),
    formatthis(x){
      return numberFormatter("### ### ###.00", x)
    }
  },
  created(){
    this.getallproductsforgestion()
  },
  computed:{
    ...mapGetters('product', ['getproducts', 'showstatus']),
    ...mapGetters('company', ['getinfo'])
  }
}
</script>

<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

</style>