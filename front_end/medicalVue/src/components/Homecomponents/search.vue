<template>
    <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Recherche de produit</div>
        </q-card-section>
        <q-card-section class="">
    <form @submit.prevent="onSubmit">
      <q-input   v-model="search" label="tapez quelque chose... " >
          <template v-slot:append>
          <q-icon name="search"></q-icon>
        </template>
      </q-input>
    </form>
        </q-card-section>
    </q-card>
</template>

<script>
export default {
    name: 'search',
    data(){
        return {
            search: ''
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
                icon: 'search',
                message: 'Voici les résultats !'
            })
        }
    }
}
</script>

<style>
.my-card {
}
</style>