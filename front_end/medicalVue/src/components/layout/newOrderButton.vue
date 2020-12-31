<template>
  
    <q-page-sticky position="bottom-right" class="q-pa-xl" :offset="[18, 18]">
      <q-btn fab icon="add"  @click="dialog = !dialog"  color="blue-grey-5" ><q-tooltip anchor="top middle">nouvelle commande</q-tooltip></q-btn>
    <q-dialog v-model="dialog" >
      <q-card class="bg-blue-grey-8 text-white ">
        <q-card-section>
          <div class="text-h6">Veuillez choisir</div>
        </q-card-section>

        <q-card-section class="row q-gutter-xl justify-between justify-center">
            <q-card  @click="$router.push({name: 'NewOrder'})" class="my-cards col q-pa-xl text-center" v-close-popup >
            <q-icon name="person_add_alt_1" style="font-size: 10rem;" color="blue-grey-8"></q-icon>
                <h6 style="color:#455A64"><b>Nouveau Client</b> </h6>
            </q-card>
            <q-card @click="$router.push({name: 'SearchUsers'})" class="my-cards col q-pa-xl text-center" v-close-popup >
            <q-icon name="how_to_reg" style="font-size: 10rem;" color="blue-grey-8"></q-icon>
                <h6 style="color:#455A64"><b>Client existant</b></h6>
            </q-card>
        </q-card-section>

        <q-card-section class="q-pt-none float-right">
          <q-btn flat label="Fermer" v-close-popup />
        </q-card-section>
      </q-card>
    </q-dialog>
    </q-page-sticky>
</template>

<script>
export default {
  data(){
    return {
      dialog: false
    }
  }
}
</script>
<style lang="scss" scoped>
.my-card{
    height: 300px;
    width: 500px;
}
</style>