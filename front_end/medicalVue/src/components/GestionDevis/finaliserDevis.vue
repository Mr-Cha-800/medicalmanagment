<template>
  <q-btn v-if="caisse === 'CASH'" @click="show" flat >Finaliser
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
  <q-btn v-else-if="caisse === 'CNAS' || caisse === 'CASNOS' ||caisse === 'CAMSSP'" @click="show" flat >Finaliser
      <q-dialog>
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
    <q-dialog  v-model="dialog" persistent transition-show="flip-down" transition-hide="flip-up">
      <q-card class="bg-blue-grey-8" style="min-width: 350px">
        <q-card-section>
          <div class="text-h6 text-white">Le nom et prénom</div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input dense standout dark v-model="order.Nom_Prenom" autofocus />
        </q-card-section>
        <q-card-section>
          <div class="text-h6 text-white">Le numéro de la piece d'identité (Carte N., Permis ...)</div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          <q-input dense standout dark v-model="order.ID_seyed" />
        </q-card-section>

        <q-card-actions align="right" class="text-primary">
          <q-btn no-caps color="white" flat label="Annuler" v-close-popup />
          <q-btn no-caps color="white" @click="finaliser" flat label="Valider" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
  </q-btn>
</template>


<script>
import { mapActions } from 'vuex'
export default {
    data(){
        return {   
            dialog: false,
            order:{
                ID_seyed: '',
                Nom_Prenom: ''
            }
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
        ...mapActions('devis', ['finaliserdevis']),
            show(){
            this.dialog = true
            },
            finaliser(){
                this.finaliserdevis({
                    Id: this.id,
                    ID_seyed:  this.order.ID_seyed,
                    Nom_Prenom: this.order.Nom_Prenom
                })
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