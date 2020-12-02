<template>
    <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Nouvelle commande</div>
        </q-card-section>

        <q-separator />

            <q-form
      @submit.prevent="onSubmit"
      class="justify-center q-pa-lg"
    >
    <div class="text-h6">Informations du client</div>
      <q-input
        v-model="neworder.nom"
        type="text"
        class="q-pa-md"
        label="Nom *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper le nom']"
      >
      </q-input>
      <q-input
        v-model="neworder.prenom"
        type="text"
        class="q-pa-md"
        label="Prénom *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper le prénom']"
      >
      </q-input>
    <div class="q-gutter-sm justify-center q-pa-md">
       <q-input
        v-model="neworder.numId"
        label="N° de la carte d'identité"
        hint="facultatif"
      >
      </q-input>
    </div>
    <div class="q-gutter-sm justify-center q-pa-md">
       <q-input
        v-model="neworder.numPermis"
        label="N° de permis de conduire"
        hint="facultatif"
      >
      </q-input>
    </div>
    <div class="text-h6">Commande</div>
    <div class="q-pa-md">
    <q-select
      v-model="neworder.commande"
      label="Désignation/Référence du produit"
      use-input
      use-chips
      multiple
      input-debounce="0"
      @new-value="createValue"
      :options="filterOptions"
      @filter="filterFn"
      option-label = "nom"
      emit-value
      map-options
    >
        <template v-slot:option="scope">
          <q-item
            v-bind="scope.itemProps"
            v-on="scope.itemEvents"
          >
            <q-item-section>
              <q-item-label v-html="scope.opt.nom" />
              <q-item-label caption>{{ scope.opt.ref }}</q-item-label>
            </q-item-section>
          </q-item>
        </template>
    </q-select>
  </div>
    <div class="q-pa-lg">
    <table>
      <tr>
        <th>N° Réf</th>
        <th style="width:100%">Désignation</th>
        <th style="width:10%">Quantité</th>
        <th>Montant</th>
      </tr>
      <tr v-for="product in neworder.commande" :key="product.id">
        <td>{{product.ref}}</td>
        <td style="width:100%">{{product.nom}}  </td>
        <td style="width:10%"><q-input type="number" min="1" lazy-rules :rules="[ val => val >= 1 || '1 ou plus' ]" v-model="product.quantity"/></td>
        <td>{{product.quantity*product.price}} Da</td>
      </tr>
    </table>
    </div>
      <div class="q-pa-md ">
    <q-btn no-caps type="submit" push color="blue-grey-5" :loading="loading" :disabled="loading"  icon-right="send" label="Générer la facture" >
      <template v-slot:loading>
        <q-spinner-hourglass class="on-left" />
        Chargement...
      </template>
    </q-btn>
      </div>
    </q-form>
        </q-card>
</template>

<script>
import { mapActions } from 'vuex'
const stringOptions = [{
          ref: '23165485',
          nom: 'Google',
          quantity: '1',
          price: '10'
        },
        {
          ref: '23165486',
          nom: 'Facebook',
          quantity: '1',
          price: '200'
        },
        {
          ref: '23165487',
          nom: 'Twitter',
          quantity: '1',
          price: '700'
        },
        {
          ref: '23165488',
          nom: 'Apple',
          quantity: '1',
          price: '120'
        },
        {
          ref: '23165489',
          nom: 'Oracle',
          quantity: '1',
          price: '310'
        }
]
export default {
  data(){
    return {
      loading: false,
      neworder:{
        nom: '',
        prenom: '',
        numId: '',
        numPermis: '',
        commande: null
      },
      model: null,
      filterOptions: stringOptions
    }
  },
  
  methods: {
    ...mapActions('order', ['order']),
    createValue (val, done) {
      if (val.length > 2) {
        if (!stringOptions.includes(val)) {
          done(val, 'add-unique')
        }
      }
    },

    filterFn (val, update) {
      update(() => {
        if (val === '') {
          this.filterOptions = stringOptions
        }
        else {
          const needle = val.toLowerCase()
          this.filterOptions = stringOptions.filter(
            v => v.nom.toLowerCase().indexOf(needle) > -1 || v.ref.toLowerCase().indexOf(needle) > -1 
          )
        }
      })
    },
    onSubmit(){
      this.order(this.neworder)
      .then(response => {
        if(response){
          this.$q.notify({
              color: 'green-4',
              textColor: 'white',
              icon: 'cloud_done',
              message: "SAHHHhhééééét rak commandit bien ga3"
            })
          }
      }).catch(error => {
        console.log(error)
      })
    }
  }
}
</script>

<style>

</style>