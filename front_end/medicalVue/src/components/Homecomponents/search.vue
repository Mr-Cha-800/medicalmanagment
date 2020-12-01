<template>
    <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Recherche de produit</div>
        </q-card-section>
        <q-card-section class="">
      <q-input   v-model="text" label="tapez quelque chose... " >
          <template v-slot:append>
          <q-icon name="search"></q-icon>
        </template>
      </q-input>
        </q-card-section>
    </q-card>
</template>

<script>
export default {
    name: 'search'
}
</script>

<style>
.my-card {
}
</style>