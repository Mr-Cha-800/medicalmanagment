<template>
  <div class="q-pa-xl">
      <q-card class="bg-white">
            <q-form
      @submit.prevent="updatefact"
    >
        <q-card-section>
          <div class="text-h6">Numero de sécurité social</div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input  v-model="devis[0].Numsecsocial" autofocus />
        </q-card-section>
        
        <q-card-section>
          <div class="text-h6">Nom du patient</div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input   v-model="devis[0].patient_nom" autofocus />
        </q-card-section>

        
        <q-card-section>
          <div class="text-h6">Prenom du patient</div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input   v-model="devis[0].patient_prenom" autofocus />
        </q-card-section>

        
        <q-card-section>
          <div class="text-h6">Date de naissance du patient</div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input type="date"  v-model="devis[0].patient_datenaiss" autofocus />
        </q-card-section>

        
        <q-card-section>
          <div class="text-h6">Lieu de naissance du patient</div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input  v-model="devis[0].patient_lieunaiss" autofocus />
        </q-card-section>
        
        
        <q-card-section class="q-pt-none float-right">
          <q-btn flat label="Annuler" v-close-popup />
          <q-btn no-caps type="submit" push color="blue-grey-5" :loading="loading" :disabled="loading"  icon-right="send" label="Modifier" >
      <template v-slot:loading>
        <q-spinner-hourglass class="on-left" />
        Chargement...
      </template>
    </q-btn>
    </q-card-section>
      
    </q-form>
      </q-card>
  </div>
    
</template>

<script>
import { mapActions } from 'vuex'
import axios from 'axios'

export default {
    data(){
        return {   
            dialog: false,
            loading: false,
            devis : {}
        }
    },
    methods: {
        ...mapActions('order', ['setoneorder']),
            deletees(){
                this.setoneorder({
                  id: this.$route.params.id,
                  caisse: this.$route.params.caisse
                })
                .then(Response => {
                if(Response){
                  this.devis = Response.data
                }
                })
                .catch(err => {
                console.log(err)
                })
        },
        updatefact(){
          this.loading = true
          axios.patch('/factures/updatelast/'+this.$route.params.id+'/'+this.$route.params.caisse,{
            Numsecsocial: this.devis[0].Numsecsocial,
            patient_nom: this.devis[0].patient_nom,
            patient_prenom: this.devis[0].patient_prenom,
            patient_datenaiss: this.devis[0].patient_datenaiss,
            patient_lieunaiss: this.devis[0].patient_lieunaiss
          }).then(response =>{
            if(response){
              this.loading = false
              this.$router.go(-1)
              this.$q.notify({
                  color: 'green-4',
                  textColor: 'white',
                  icon: 'done',
                  message: 'Modifié!'
              })
            }
          }).catch(error  =>{
            console.log(error)
              this.$q.notify({
                  color: 'red-4',
                  textColor: 'white',
                  icon: 'clear',
                  message: 'Probleme survenu ! Veuillez réessayer'
              })
          })
        }
    },
    created(){
      this.deletees()
    }
}
</script>


<style>

</style>