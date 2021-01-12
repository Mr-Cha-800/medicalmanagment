<template>
  <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Liste des dossiers</div>
        </q-card-section>

        <q-separator />

        <q-card-actions class="q-pa-xl">
<table>
  <tr>
    <th>N° Dossier</th>
    <th>Nom</th>
    <th>Prénom</th>
    <th>N° Séc Social</th>
    <th>N° téléphone</th>
    <th>Caisse</th>
    <th>Wilaya</th>
    <th></th>
  </tr>
  <template  v-for="user in getallusers" >
  <tr :key="user.ID">
    <td>{{user.ID}}/{{user.year}}</td>
    <td>{{user.nom}}</td>
    <td>{{user.prenom}}</td>
    <td>{{user.NumSecSocial}}</td> 
    <td>{{user.NumTel}}</td> 
    <td>{{user.Caisse}}</td>
    <td>{{user.Wilaya}}</td>
    <td><q-btn round flat @click="$router.push({name: 'ModifyClient', params: { id: user.ID }})" 
       icon="edit" color="blue-grey-5">
            <q-tooltip>Modifier</q-tooltip>
        </q-btn>
      </td>
  </tr>
  </template>
</table>
        </q-card-actions>
        </q-card>
</template>

<script>
import {  mapActions, mapGetters, mapMutations } from 'vuex'
export default {
  methods:{
      ...mapActions('devis',['searchusers']),
      ...mapMutations('devis', ['setuser']),
      choose(id){
        this.setuser(id)
        this.$router.replace({
        name: 'NewOrderOldDossier'
        })
      }
  },
  computed:{
    ...mapGetters('devis',['getallusers'])
  },
  created(){
      this.searchusers('')
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