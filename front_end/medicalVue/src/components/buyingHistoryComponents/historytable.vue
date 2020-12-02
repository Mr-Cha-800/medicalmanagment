<template>
  <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Historique des achats</div>
        </q-card-section>

        <q-separator />

        <q-card-actions class="q-pa-xl">
<table>
  <tr>
    <th>N° Facture</th>
    <th>Nom du client</th>
    <th>Prénom du client</th>
    <th>Date</th>
    <th>Montant TTC</th>
    <th>Visualiser</th>
    <th>Imprimer</th>
    <th>Supprimer</th>
  </tr>
  <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria </td>
    <td>Chouchou</td>
    <td>16 décembre 2020</td> 
    <td>100 Da</td>
    <td><q-btn round flat @click="$router.push({name: 'Invoiceshow', params: { id: 3 }})" ><q-icon color="green" class="fixed-center" name="remove_red_eye"/><q-tooltip>Visualiser</q-tooltip></q-btn></td>
    <td><q-btn round flat><q-icon color="blue-grey-5"  name="print"/><q-tooltip>imprimer</q-tooltip></q-btn></td>
    <td><q-btn round flat><q-icon color="red" @click="deletee"  name="delete"/><q-tooltip>supprimer</q-tooltip></q-btn></td>
  </tr>
  <tr>
    <td>Centro comercial Moctezuma</td>
    <td>Francisco Chang</td>
    <td>Chouchou</td>
    <td>16 décembre 2020</td> 
    <td>200 Da</td>
    <td><q-btn round flat @click="$router.push({name: 'Invoiceshow', params: { id: 3 }})" ><q-icon color="green"  name="remove_red_eye"/><q-tooltip>Visualiser</q-tooltip></q-btn></td>
    <td><q-btn round flat><q-icon color="blue-grey-5"  name="print"/><q-tooltip>imprimer</q-tooltip></q-btn></td>
    <td><q-btn round flat><q-icon color="red" @click="deletee"  name="delete"/><q-tooltip>supprimer</q-tooltip></q-btn></td>
  </tr>
  <tr>
    <td>Ernst Handel</td>
    <td>Roland Mendel</td>
    <td>Chouchou</td>
    <td>16 décembre 2020</td> 
    <td>300 Da</td>
    <td><q-btn round flat @click="$router.push({name: 'Invoiceshow', params: { id: 3 }})" ><q-icon color="green"  name="remove_red_eye"/><q-tooltip>Visualiser</q-tooltip></q-btn></td>
    <td><q-btn round flat><q-icon color="blue-grey-5"  name="print"/><q-tooltip>imprimer</q-tooltip></q-btn></td>
    <td><q-btn round flat><q-icon color="red" @click="deletee"  name="delete"/><q-tooltip>supprimer</q-tooltip></q-btn></td>
  </tr>
  <tr>
    <td>Island Trading</td>
    <td>Helen Bennett</td>
    <td>Chouchou</td>
    <td>16 décembre 2020</td> 
    <td>400 Da</td> 
    <td><q-btn round flat @click="$router.push({name: 'Invoiceshow', params: { id: 3 }})" ><q-icon color="green"  name="remove_red_eye"/><q-tooltip>Visualiser</q-tooltip></q-btn></td>
    <td><q-btn round flat><q-icon color="blue-grey-5" name="print"/><q-tooltip>imprimer</q-tooltip></q-btn></td>
    <td><q-btn round flat><q-icon color="red" @click="deletee"  name="delete"/><q-tooltip>supprimer</q-tooltip></q-btn></td>
  </tr>
  <tr>
    <td>Laughing Bacchus Winecellars</td>
    <td>Yoshi Tannamuri</td>
    <td>Chouchou</td>
    <td>16 décembre 2020</td> 
    <td>500 Da</td>
    <td><q-btn round flat @click="$router.push({name: 'Invoiceshow', params: { id: 3 }})" ><q-icon color="green"  name="remove_red_eye"/><q-tooltip>Visualiser</q-tooltip></q-btn></td>
    <td><q-btn round flat><q-icon color="blue-grey-5"  name="print"/><q-tooltip>imprimer</q-tooltip></q-btn></td>
    <td><q-btn round flat><q-icon color="red" @click="deletee"  name="delete"/><q-tooltip>supprimer</q-tooltip></q-btn></td>
  </tr>
  <tr>
    <td>Magazzini Alimentari Riuniti</td>
    <td>Giovanni Rovelli</td>
    <td>Chouchou</td>
    <td>16 décembre 2020</td> 
    <td>600 Da</td>
    <td><q-btn round flat @click="$router.push({name: 'Invoiceshow', params: { id: 3 }})" ><q-icon color="green"  name="remove_red_eye"/><q-tooltip>Visualiser</q-tooltip></q-btn></td>
    <td><q-btn round flat><q-icon color="blue-grey-5"  name="print"/><q-tooltip>imprimer</q-tooltip></q-btn></td>
    <td><q-btn round flat><q-icon color="red" @click="deletee"  name="delete"/><q-tooltip>supprimer</q-tooltip></q-btn></td>
  </tr>
</table>
        </q-card-actions>
    <q-dialog v-model="dialog" persistent transition-show="flip-down" transition-hide="flip-up">
      <q-card class="bg-blue-grey-8 text-white">
        <q-card-section>
          <div class="text-h6">Alert</div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          Voulez vous vraiment supprimer ?
        </q-card-section>

        <q-card-section class="q-pt-none float-right">
          <q-btn flat label="Cancel" v-close-popup />
          <q-btn flat label="Supprimer" v-close-popup @click="deletees()"  />
          </q-card-section>
      </q-card>
    </q-dialog>
        </q-card>
</template>

<script>
export default {
  data(){
    return {
      dialog: false
    }
  },
  methods: {
    deletee(){
      this.dialog = true
    },
    deletees(){
      this.$q.notify({
          color: 'green-4',
          textColor: 'white',
          icon: 'done',
          message: 'produit supprimé !'
      })
    }
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