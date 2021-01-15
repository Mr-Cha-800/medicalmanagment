<template>
  <q-btn 
  no-caps 
  @click="dialog = !dialog" 
  color="red-8" 
  icon-right="save" 
  label="Sauvegarder la base de données" >
     <q-dialog v-model="dialog" persistent transition-show="flip-down" transition-hide="flip-up">
      <q-card class="bg-blue-grey-8 text-white">
        <q-card-section>
          <div class="text-h6">Donner le chemin</div>
        </q-card-section>

        <q-card-section class="text-white q-pt-none">
          <q-input dense 
          placeholder='Le chemin sans le "/" à la fin'  
          v-model="chemin" 
          rounded
          outlined
          class="text-white"
          filled
          bg-color="white"
          color="white"
          @keyup.enter="savedata(),dialog = false" />
        </q-card-section>

        <q-card-section class="q-pt-none float-right">
          <q-btn flat label="Annuler" v-close-popup />
          <q-btn flat label="sauvegarder" v-close-popup @click="savedata()"  />
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
            dialog:false,
            chemin: "D:/orthosoft"
        }
    },
    methods: {
        ...mapActions('company',['savedatabase']),
        savedata(){
            this.savedatabase(this.chemin)
            .then(Response => {
                if(Response){
                    this.$q.notify({
                        color: 'green-4',
                        textColor: 'white',
                        icon: 'done',
                        message: 'Base de données enregistré !'
                    })
                }
                })
                .catch(err => {
                console.log(err)
                    this.$q.notify({
                        color: 'red-4',
                        textColor: 'white',
                        icon: 'clear',
                        message: 'Non enregistré! Veuillez donner un chemin correcte'
                    })
                })
        }
    }
}
</script>

<style>
q-input { color: 'red'; }
</style>