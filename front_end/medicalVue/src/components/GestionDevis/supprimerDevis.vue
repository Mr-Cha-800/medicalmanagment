<template>
  <q-btn round flat>
      <q-icon color="red" @click="deletee"  name="delete"/>
      <q-tooltip>Supprimer</q-tooltip>
    <q-dialog v-model="dialog" persistent transition-show="flip-down" transition-hide="flip-up">
      <q-card class="bg-blue-grey-8 text-white">
        <q-card-section>
          <div class="text-h6">Alerte</div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          Voulez vous vraiment Supprimer ?
        </q-card-section>

        <q-card-section class="q-pt-none float-right">
          <q-btn flat label="Annuler" v-close-popup />
          <q-btn flat label="Supprimer" v-close-popup @click="deletees()"  />
          </q-card-section>
      </q-card>
    </q-dialog>
  </q-btn>
    
</template>

<script>
import { mapActions } from 'vuex'
export default {
    data(){
        return {   
            dialog: false
        }
    },
    props:{
        id: {
         type: Number,
         required: true
        },
        caisse: {
          type: String,
          required: true
        }
    },
    methods: {
        ...mapActions('devis', ['deletedevis']),
            deletee(){
            this.dialog = true
            },
            deletees(){
                this.deletedevis({
                  id: this.id,
                  caisse: this.caisse
                })
                .then(Response => {
                if(Response){
                    this.$q.notify({
                        color: 'green-4',
                        textColor: 'white',
                        icon: 'done',
                        message: 'Devis supprimé !'
                    })
                }
                })
                .catch(err => {
                console.log(err)
                    this.$q.notify({
                        color: 'red-4',
                        textColor: 'white',
                        icon: 'clear',
                        message: 'Devis non supprimé ! Veuillez réessayer'
                    })
                })
        }
    }
}
</script>


<style>

</style>