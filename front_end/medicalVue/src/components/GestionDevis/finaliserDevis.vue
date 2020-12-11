<template>
  <q-btn @click="show" flat >Finaliser
      <q-dialog v-model="dialog" persistent transition-show="flip-down" transition-hide="flip-up">
      <q-card class="bg-blue-grey-8 text-white">
        <q-card-section>
          <div class="text-h6">Alerte</div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          Voulez vous vraiment finaliser ?
        </q-card-section>

        <q-card-section class="q-pt-none float-right">
          <q-btn flat label="Annuler" v-close-popup />
          <q-btn flat label="Finaliser" v-close-popup @click="finaliser()"  />
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
    },
    methods: {
        ...mapActions('devis', ['finaliserdevis']),
            show(){
            this.dialog = true
            },
            finaliser(){
                this.finaliserdevis(this.id)
                .then(Response => {
                if(Response){
                    this.$q.notify({
                        color: 'green-4',
                        textColor: 'white',
                        icon: 'done',
                        message: 'Devis finalisé !'
                    })
                }
                })
                .catch(err => {
                console.log(err)
                    this.$q.notify({
                        color: 'red-4',
                        textColor: 'white',
                        icon: 'clear',
                        message: 'Devis non finalisé ! Veuillez réessayer'
                    })
                })
        }
    }
}
</script>


<style>

</style>