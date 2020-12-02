<template>
  
  <div class="q-pa-xl q-gutter-xl">
    <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Nouveau produit</div>
        </q-card-section>

        <q-separator />

            <q-form
      @submit.prevent="onSubmit"
      class="justify-center q-pa-lg"
    >
      <q-input
        v-model="produit.nom"
        type="text"
        class="q-pa-md"
        label="le nom du produit *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper le nom du produit']"
      >
      </q-input>
      <q-input
        v-model="produit.descriptionProduit"
        type="textarea"
        class="q-pa-md"
        label="Description du produit *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez remplir']"
      >
      </q-input>
    <div class="q-gutter-sm justify-center q-pa-md">
       <q-input
        type="number"
        v-model="produit.prixProduit"
        label="prix"
        :rules="[ val => val && val.length > 0 || 'veuillez remplir']"
      >
      </q-input>
    </div>
      <div class="q-pa-md ">
    <q-btn no-caps type="submit" push color="blue-grey-5" :loading="loading" :disabled="loading"  icon-right="send" label="Ajouter nouveau produit" >
      <template v-slot:loading>
        <q-spinner-hourglass class="on-left" />
        Chargement...
      </template>
    </q-btn>
      </div>
    </q-form>
        </q-card>
    </div>
</template>

<script>
export default {
    data(){
        return{
            loading: false,
            produit:{
                nomProduit: '',
                descriptionProduit: '',
                prixProduit: '',
            }
        }
    },
    methods:{
      onSubmit(){
            this.$router.replace({
            name: 'ProductManagment'
          })
            this.$q.notify({
                color: 'green-4',
                textColor: 'white',
                icon: 'done',
                message: 'produit crée !'
            })
      }
    }
}
</script>

<style>

</style>