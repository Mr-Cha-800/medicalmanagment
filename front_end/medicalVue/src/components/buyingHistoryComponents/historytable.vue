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
    <th>Nom</th>
    <th>Prénom</th>
    <th>Date</th>
    <th>Visualiser</th>
    <th>Supprimer</th>
  </tr>
  <template v-for="devis in getallorders">
  <tr v-if="devis.Caissee !== 'CASH'" :key="devis.id">
    <td>{{devis.idfact}}/{{devis.Annee}}</td>
    <td>{{devis.nom}}</td>
    <td>{{devis.prenom}}</td>
    <td>{{dateme(devis.datee)}}</td> 
    <td class="text-center"><q-btn round flat @click="$router.push({name: 'Invoiceshow', params: { id: devis.idfact, caisse:devis.Caissee }})" ><q-icon color="green" name="remove_red_eye"/><q-tooltip>Visualiser</q-tooltip></q-btn></td>
    <td class="text-center"> <supprimerDevis :id="devis.idfact" /></td>
  </tr>
  </template>
</table>
        </q-card-actions>
    <q-dialog v-model="dialog" persistent transition-show="flip-down" transition-hide="flip-up">
      <q-card class="bg-blue-grey-8 text-white">
        <q-card-section>
          <div class="text-h6">Alerte</div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          Voulez vous vraiment Supprimer ?
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
import { date } from 'quasar'
import { mapActions, mapGetters } from 'vuex'
import supprimerDevis from '../GestionDevis/supprimerDevis'
export default {
  components:{ supprimerDevis },
  data(){
    return {
      dialog: false
    }
  },
  methods: {
    ...mapActions('order', ['setorders']),
    deletee(){
      this.dialog = true
    },
    deletees(){
      this.$q.notify({
          color: 'green-4',
          textColor: 'white',
          icon: 'done',
          message: 'devis supprimé !'
      })
    },
    dateme(datee){
      return date.formatDate(datee, 'DD MMM YYYY')
    }
  },
  created(){
    this.setorders()
  },
  computed:{
    ...mapGetters('order',['getallorders'])
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