<template>  
    <q-btn no-caps @click="dialog = !dialog" flat>Nouvelle commande
      <q-dialog v-model="dialog" >
      <q-card class="bg-blue-grey-8 text-white ">
        <q-card-section>
          <div class="text-h6">Veuillez choisir</div>
        </q-card-section>

        <q-card-section class="row q-gutter-xl justify-between justify-center">
            <q-card  @click="$router.push({name: 'NewOrder'})" class="my-card col q-pa-xl text-center">
            <q-icon name="person_add_alt_1" style="font-size: 10rem;" color="blue-grey-8"></q-icon>
                <h6 style="color:#455A64"><b>Nouveau Client</b> </h6>

            </q-card>
            <q-card @click="$router.push({name: 'ProductManagment'})" class="my-card col q-pa-xl text-center">
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
import { mapActions } from 'vuex'
export default {
    data(){
        return {   
            dialog: false
        }
    },
    props:{
        id: {
         type: Number,
         required: true
        },
    },
    methods: {
        ...mapActions('devis', ['finaliserdevis']),
            show(){
            this.dialog = true
            },
            finaliser(){
                this.finaliserdevis(this.id)
                .then(Response => {
                if(Response){
                    this.$q.notify({
                        color: 'green-4',
                        textColor: 'white',
                        icon: 'done',
                        message: 'Devis finalisé !'
                    })
                }
                })
                .catch(err => {
                console.log(err)
                    this.$q.notify({
                        color: 'red-4',
                        textColor: 'white',
                        icon: 'clear',
                        message: 'Devis non finalisé ! Veuillez réessayer'
                    })
                })
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