<template>
    <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Rechercher un produit</div>
        </q-card-section>
        <q-card-section class="">
      <q-input   v-model="search" label="Désignation/Référence du produit... " >
          <template v-slot:append>
          <q-icon name="search"></q-icon>
        </template>
      </q-input>
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
        ...mapActions('product', ['searchproducts']),
        onSubmit(){
            this.searchproducts(this.search)
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