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
          <q-btn flat label="Supprimer" v-close-popup @click="deletees"  />
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
        ...mapActions('product', ['deleteproduct']),
            deletee(){
            this.dialog = true
            },
            deletees(){
                this.deleteproduct(this.id)
                .then(Response => {
                if(Response){
                    this.loading = false
                    this.$q.notify({
                        color: 'green-4',
                        textColor: 'white',
                        icon: 'done',
                        message: 'Produit supprimé !'
                    })
                }
                })
                .catch(err => {
                    this.loading = false
                console.log(err)
                    this.$q.notify({
                        color: 'red-4',
                        textColor: 'white',
                        icon: 'clear',
                        message: 'Produit non supprimé ! Veuillez réessayer'
                    })
                })
        }
    }
}
</script>

<style>

</style>