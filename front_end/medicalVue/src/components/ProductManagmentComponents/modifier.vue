<template>
  
  <div class="q-pa-xl q-gutter-xl">
    <q-card class="my-card fit-content">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Modifier le produit</div>
        </q-card-section>

        <q-separator />

            <q-form
      @submit.prevent="onSubmit"
      class="justify-center q-pa-lg "
    >
      <q-input
        v-model="produit.Ref"
        type="text"
        class="q-pa-md"
        label="N° Réf."
        disable
      >
      </q-input>
      <q-input
        v-model="produit.nomProduit"
        type="text"
        class="q-pa-md"
        label="Désignation *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'Veuillez taper la désignation']"
      >
      </q-input>
    <div class="q-gutter-sm justify-center q-pa-md q-pb-xl">
       <q-input
        type="number"
        v-model="produit.montantProduit"
        label="Prix unitaire"
        :rules="[ val => val && val.length > 0 || 'Veuillez taper la somme en DA']"
      >
      </q-input>
    </div>
      <div class=" q-pr-lg q-pt-lg q-pb-lg q-gutter-md absolute-bottom-right ">
    <q-btn no-caps  push color="red-5" @click="$router.push({name: 'ProductManagment'})" icon="clear" label="Annuler" />
    <q-btn no-caps type="submit" push color="blue-grey-5" :loading="loading" :disabled="loading"  icon-right="send" label="Términé" >
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
                Ref: '56452323',
                nomProduit: 'mr wasmo',
                descriptionProduit: 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusantium, quaerat exercitationem nisi quae, repudiandae corrupti neque recusandae illum hic aspernatur delectus id vero earum illo ad itaque assumenda! Expedita, unde!',
                montantProduit: '5000',
            }
        }
    },
    methods:{
        onSubmit(){
            this.$router.replace({
            name: 'chercheproduit'
          })
            this.$q.notify({
                color: 'green-4',
                textColor: 'white',
                icon: 'done',
                message: 'Modifié !'
            })
        }
    }
}
</script>

<style>

</style>