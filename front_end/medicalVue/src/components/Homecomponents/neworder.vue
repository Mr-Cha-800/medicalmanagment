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
    <div class="q-gutter-sm full-width q-pa-md row">
       <q-input
        v-model="tel"
        label="Produit"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper la reference du produit']"
      >
      </q-input>
       <q-input
        v-model="tel"
        type="number"
        label="Quantité"
        min="1"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper la quantité']"
      >
      </q-input>
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
export default {
  data(){
    return {

    }
  }
}
</script>

<style>

</style>