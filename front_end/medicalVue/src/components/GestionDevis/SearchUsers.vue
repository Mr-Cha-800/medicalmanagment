<template>
    <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Recherche Utilisateur</div>
        </q-card-section>
        <q-card-section class="">
    <form @submit.prevent="onSubmit">
      <q-input   v-model="search" label="Nom, Prénom, Num de tél etc... " >
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
        ...mapActions('devis', ['searchusers']),
        onSubmit(){
            this.searchusers(this.search)
            .then(() => {
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