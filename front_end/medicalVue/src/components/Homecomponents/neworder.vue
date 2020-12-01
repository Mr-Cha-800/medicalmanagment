<template>
    <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Nouvelle Commande</div>
        </q-card-section>

        <q-separator />

            <q-form
      @submit.prevent="onSubmit"
      @reset="onReset"
      class="justify-center q-pa-sm"
    >
      <q-input
        v-model="nom"
        type="text"
        class="q-pa-md"
        label="Votre Prénom *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper votre prénom']"
      >
      </q-input>
      <q-input
        v-model="nomvrai"
        type="text"
        class="q-pa-md"
        label="Votre Nom *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper votre prénom']"
      >
      </q-input>
    <div class="q-gutter-sm justify-center q-pa-md">
       <q-input
        v-model="tel"
        label="Téléphone"
        mask="(##) ## ## ## ##"
        fill-mask
        hint="Aide: (##) ## ## ## ##"
        :rules="[val => !!val || 'Obligatoire',
          val => val && val.length > 0  || 'veuillez remplir correctement']"
      >
      </q-input>
    </div>
      <div>
    <q-btn no-caps type="submit" push color="blue-grey-5" :loading="loading" :disabled="loading"  icon-right="send" label="Acheter" >      <template v-slot:loading>
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

}
</script>

<style>

</style>