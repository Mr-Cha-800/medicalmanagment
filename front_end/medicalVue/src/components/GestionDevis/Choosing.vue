<template>  
    <q-btn no-caps @click="dialog = !dialog" flat>Nouvelle commande
      <q-dialog v-model="dialog" >
      <q-card class="bg-blue-grey-8 text-white ">
        <q-card-section>
          <div class="text-h6">Veuillez choisir</div>
        </q-card-section>

        <q-card-section class="row q-gutter-xl justify-between justify-center">
            <q-card  @click="$router.push({name: 'NewOrder'})" class="my-card col q-pa-xl text-center" v-close-popup >
            <q-icon name="person_add_alt_1" style="font-size: 10rem;" color="blue-grey-8"></q-icon>
                <h6 style="color:#455A64"><b>Nouveau Client</b> </h6>
            </q-card>
            <q-card @click="$router.push({name: 'ProductManagment'})" class="my-card col q-pa-xl text-center" v-close-popup >
            <q-icon name="how_to_reg" style="font-size: 10rem;" color="blue-grey-8"></q-icon>
                <h6 style="color:#455A64"><b>Client existant</b></h6>
            </q-card>
        </q-card-section>

        <q-card-section class="q-pt-none float-right">
          <q-btn flat label="Fermer" v-close-popup />
          </q-card-section>
      </q-card>
    </q-dialog>
    </q-btn>
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