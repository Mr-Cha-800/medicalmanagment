<template>
    <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Nouvelle Commande</div>
        </q-card-section>

        <q-separator />

            <q-form
      @submit.prevent="onSubmit"
      @reset="onReset"
      class="justify-center q-pa-lg"
    >
    <div class="text-h6">Informations de client</div>
      <q-input
        v-model="nom"
        type="text"
        class="q-pa-md"
        label="Votre Prénom *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper le prénom']"
      >
      </q-input>
      <q-input
        v-model="nomvrai"
        type="text"
        class="q-pa-md"
        label="Votre Nom *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper le nom']"
      >
      </q-input>
    <div class="q-gutter-sm justify-center q-pa-md">
       <q-input
        v-model="tel"
        label="Numero carte Id"
        hint="facultatif"
      >
      </q-input>
    </div>
    <div class="q-gutter-sm justify-center q-pa-md">
       <q-input
        v-model="tel"
        label="Numero permis de conduire"
        hint="facultatif"
      >
      </q-input>
    </div>
    <div class="text-h6">Commande</div>
    <div class="q-pa-md">
    <q-select
      filled
      v-model="model"
      use-input
      use-chips
      multiple
      input-debounce="0"
      @new-value="createValue"
      :options="filterOptions"
      @filter="filterFn"
      style="width: 250px"
    />
  </div>
      <div class="q-pa-md ">
    <q-btn no-caps type="submit" push color="blue-grey-5" :loading="loading" :disabled="loading"  icon-right="send" label="Générer la facture" >      <template v-slot:loading>
        <q-spinner-hourglass class="on-left" />
        Loading...
      </template>
    </q-btn>
      </div>
    </q-form>
        </q-card>
</template>

<script>
const stringOptions = [
  'Google', 'Facebook', 'Twitter', 'Apple', 'Oracle'
]
export default {
  data(){
    return {
      neworder:{
        nom: '',
        prenom: '',
        numId: '',
        numPermis: '',
        commande: [{
          Idproduit: '',
          prix: '',
          quantity: ''
          }
        ]
      },
      model: null,
      filterOptions: stringOptions
    }
  },
  
  methods: {
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
            v => v.toLowerCase().indexOf(needle) > -1
          )
        }
      })
    }
  }
}
</script>

<style>

</style>