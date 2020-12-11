<template>
    <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Recherche dans l'historique des devis</div>
        </q-card-section>
        <q-card-section class="">
    <form @submit.prevent="onSubmit">
      <q-input   v-model="search" label="tapez quelque chose... " >
          <template v-slot:append>
          <q-icon name="search"></q-icon>
        </template>
      </q-input>
    </form>
        </q-card-section>
    </q-card>
</template>

<script>
import { mapActions } from 'vuex'
export default { 
    name: 'search',
    data(){
        return {
            search: ''
        }
    },
    methods:{
        ...mapActions('devis', ['searchdevis']),
        onSubmit(){
            this.searchdevis(this.search)
            .then(Response => {
                    if(Response){
                    this.$q.notify({
                        color: 'green-4',
                        textColor: 'white',
                        icon: 'search',
                        message: 'Voici les résultats !'
                    })
                }
            }).catch(err => {
                console.log(err)
            })
        }
    },
    watch:{
    search: function(){
        this.onSubmit()
    }
    }
}
</script>

<style>

</style>