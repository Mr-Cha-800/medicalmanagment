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
    <th>Prix unitaire</th>
    <th>TVA</th>
    <th>Modifier</th>
    <th>Supprimer</th>
  </tr>
  <tr v-for="product in getproducts" :key="product.id">
    <td>{{product.NumRef}}</td>
    <td>{{product.Designation}}</td>
    <td>{{product.PrixU}} Da</td>
    <td>{{product.tax}} %</td>
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
export default {
  components:{ supprimer },
  data(){
    return {
      dialog: false
    }
  },
  methods: {
    ...mapActions('product', ['getallproducts', 'searchproducts'])
  },
  created(){
    this.getallproducts()
  },
  computed:{
    ...mapGetters('product', ['getproducts'])
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
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

</style>