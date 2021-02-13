<template>
  <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Historique des devis</div>
        </q-card-section>

        <q-separator />

        <q-card-actions class="q-pa-md">
<table>
  <tr>
    <th>N° Devis</th>
    <th>Nom</th>
    <th>Prénom</th>
    <th>Date</th>
    <th>Num téléphone</th>
    <th>Opérations</th>
    <th>etat</th>
    <th></th>
  </tr>
  <template  v-for="devis in getalldevis" >
  <tr v-if="(deviss === 'Non-Payé' && devis.etat === 'non-finalisé') || (deviss === 'Payé' && devis.etat === 'finalisé' && devis.Caissee === 'CASH') " :key="devis.id">
    <td>{{devis.idfact}}/{{devis.Annee}}</td>
    <td>{{devis.nom}}</td>
    <td>{{devis.prenom}}</td>
    <td>{{dateme(devis.datee)}}</td> 
    <td>{{devis.NumTel}}</td> 
    <td class="text-center">
      <q-btn round flat @click="$router.push({name: 'devisshow', params: { id: devis.idfact, caisse:devis.Caissee }})" ><q-icon color="green" name="remove_red_eye"/><q-tooltip>Visualiser</q-tooltip></q-btn>
      <supprimerDevis :id="devis.idfact" :caisse="devis.Caissee" />
      </td>
    <td>{{devis.etat}}</td>
    <td v-if="devis.etat === 'non-finalisé'"  class="text-center">
      <finaliserdevis :caisse="devis.Caissee" :id="devis.idfact"/>
      </td>
      <td v-else></td>
  </tr>
  </template>
</table>
        </q-card-actions>
        </q-card>
</template>

<script>
import { date } from 'quasar'
import { mapActions, mapGetters } from 'vuex'
import finaliserdevis from './finaliserDevis'
import supprimerDevis from './supprimerDevis'
export default {
  components:{ finaliserdevis, supprimerDevis },
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
    ...mapActions('devis', ['setdevis','finaliserdevis']),
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