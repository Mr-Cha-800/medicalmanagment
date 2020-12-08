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
        v-model="showoneproduct[0].NumRef"
        type="text"
        class="q-pa-md"
        label="N° Réf."
        disable
      >
      </q-input>
      <q-input
        v-model="showoneproduct[0].Designation"
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
        v-model="showoneproduct[0].PrixU"
        label="Prix unitaire"
        :rules="[val => !!val || 'Veuillez remplir']">
      </q-input>
    </div>
      <div class=" q-pr-lg q-pt-lg q-pb-lg q-gutter-md absolute-bottom-right ">
    <q-btn no-caps  push color="red-5" @click="$router.push({name: 'ProductManagment'})"  label="Annuler" />
    <q-btn no-caps type="submit" push color="blue-grey-5" :loading="loading" :disabled="loading"  label="Modifier" >
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
import { mapActions,mapGetters } from 'vuex'
export default {
    data(){
        return{
            loading: false,
            produit:{
                Ref: '',
                nomProduit: '',
                montantProduit: '',
            }
        }
    },
    methods:{
      ...mapActions('product',['modifyproduct', 'showproduct']),
        onSubmit(){
          this.loading = true
          this.modifyproduct(this.showoneproduct[0])
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
                message: 'Produit modifié !'
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
                message: 'Produit non modifié !'
            })
        })
        },
        fill(){
            this.produit.Ref = this.showoneproduct[0].NumRef
            this.produit.nomProduit = this.showoneproduct[0].Designation
            this.produit.montantProduit = this.showoneproduct[0].PrixU
        
        }
    },
    created(){
      this.showproduct(this.$route.params.id)
   //   this.fill()
    },
    computed:{
      ...mapGetters('product',['showoneproduct'])
    }
}
</script>

<style>

</style>