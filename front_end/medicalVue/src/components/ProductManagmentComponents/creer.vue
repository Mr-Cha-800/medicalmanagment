<template>
  
  <div class="q-pa-xl q-gutter-xl">
    <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Ajouter un produit</div>
        </q-card-section>

        <q-separator />

            <q-form
      @submit.prevent="onSubmit"
      class="justify-center q-pa-lg"
    >
      <q-input
        v-model="produit.refId"
        type="text"
        class="q-pa-md"
        label="N° Réf. *"
        lazy-rules 
        :rules="[ val => !!val || 'Obligatoire' ]"
      >
      </q-input>
      <q-input
        v-model="produit.nomProduit"
        type="text"
        class="q-pa-md"
        label="Désignation *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper la désignation']"
      >
      </q-input>
    <div class="q-gutter-sm justify-center q-pa-md q-pb-xl">
       <q-input
        type="number"
        step="any"
        v-model="produit.montantProduit"
        label="Prix unitaire"
      >
      </q-input>
    </div>
    
      <q-toggle
        v-model="produit.Tva"
        :false-value="0"
        :true-value="1"
        color="blue-grey-5"
        label="Tva"
      />
      <div class=" q-pr-lg q-pt-xl q-pb-lg q-gutter-md absolute-bottom-right">
    <q-btn no-caps  push color="red-5" @click="$router.push({name: 'ProductManagment'})"  label="Annuler" />
    <q-btn no-caps type="submit" push color="blue-grey-5" :loading="loading" :disabled="loading"  label="Ajouter" >
      <template v-slot:loading>
        <q-spinner-hourglass class="on-left" />
      </template>
    </q-btn>
      </div>
    </q-form>
        </q-card>
    </div>
</template>

<script>
import { mapActions } from 'vuex'
export default {
    data(){
        return{
            loading: false,
            produit:{
                refId: '',
                nomProduit: '',
                montantProduit: '',
                Tva: 1
            }
        }
    },
    methods:{
      ...mapActions('product',['newproduct']),
      onSubmit(){
        this.loading = true
        this.newproduct(this.produit)
        .then(Response => {
          if(Response){
            this.loading = false
            this.$router.replace({
            name: 'ProductManagment'
          })
            this.$q.notify({
                color: 'green-4',
                textColor: 'white',
                icon: 'done',
                message: 'Produit ajouté !'
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
                message: 'Produit non ajouté ! Vueillez changer la valeur du Référence'
            })
        })
      }
    }
}
</script>

<style>

</style>