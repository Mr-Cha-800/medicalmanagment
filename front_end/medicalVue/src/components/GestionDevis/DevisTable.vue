<template>
  <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Historique des devis</div>
        </q-card-section>

        <q-separator />

        <q-card-actions class="q-pa-xl">
<table>
  <tr>
    <th>N° Devis</th>
    <th>Nom du client</th>
    <th>Prénom du client</th>
    <th>Date</th>
    <th>Montant TTC</th>
    <th>Opérations</th>
    <th>etat</th>
    <th></th>
  </tr>
  <template  v-for="devis in getalldevis" >
  <tr v-if="(deviss === 'Non-Payé' && devis.etat === 'non-finalisé') || (deviss === 'Payé' && devis.etat === 'finalisé') " :key="devis.id">
    <td>{{devis.idfact}}/{{devis.Annee}}</td>
    <td>{{devis.nom}}</td>
    <td>{{devis.prenom}}</td>
    <td>{{devis.datee}}</td> 
    <td>{{devis.montant}} Da</td>
    <td class="text-center">
      <q-btn round flat @click="$router.push({name: 'devisshow', params: { id: devis.idfact }})" ><q-icon color="green" name="remove_red_eye"/><q-tooltip>Visualiser</q-tooltip></q-btn>
      <supprimerDevis :id="devis.idfact" />
      </td>
    <td>{{devis.etat}}</td>
    <td v-if="devis.etat === 'non-finalisé'" class="text-center"><q-btn  flat >Finaliser</q-btn>
      </td>
      <td v-else></td>
  </tr>
  </template>
</table>
        </q-card-actions>
        </q-card>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
import supprimerDevis from './supprimerDevis'
export default {
  components:{ supprimerDevis },
  data(){
    return {
      dialog: false
    }
  },
  props:{
    deviss:{
      type: String
    }
  },
  methods: {
    ...mapActions('devis', ['setdevis']),
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
    }
  },
  created(){
    this.setdevis()
  },
  computed:{
    ...mapGetters('devis',['getalldevis'])
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