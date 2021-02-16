<template>
      <q-card class="my-card " >
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Informations du magasin</div>
          <q-item-label class="text-white" caption>
            Ces informations vont être affichées sur la facture, devis et le bon de livraison.
          </q-item-label>
        </q-card-section>

        <q-separator />
      <q-card-section horizontal>
        <q-card-section v-if="!edit" class="">
          <div class="text-h6 q-mt-sm q-mb-xs">N° RC : {{getallinfo[0].NumRegistreComm}}</div>
          <div class="text-caption text-grey">
           N° Art imp : {{getallinfo[0].NumArtImp }}
          </div>
          <div class="text-caption text-grey">
           NIF : {{ getallinfo[0].NumIdFisc}}
          </div>
          <div class="text-caption text-grey">
           TVA : {{ getallinfo[0].Tva}} %
          </div>
          <div class="text-caption text-grey">
          Téléphone 1 :  {{getallinfo[0].TelOne}} 
          </div>
            <div class="text-caption text-grey">
          Téléphone 2 :  {{getallinfo[0].TelTwo}}
          </div>
        </q-card-section>
        </q-card-section>
      <q-card-section v-if="edit">
        <q-form
      @submit.prevent="onSubmit"
      class="justify-center q-pa-lg"
    >
      <q-input
        v-model="info.NumRegistreComm"
        type="text"
        class=""
        label="Numéro de registre de commerce *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez remplir']"
      >
      </q-input>
      <q-input
        v-model="info.NumArtImp"
        type="text"
        class=""
        label="N° d'art d'imposition *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez remplir']"
      >
      </q-input>
      <q-input
        v-model="info.NumIdFisc"
        type="text"
        class=""
        label="N° d'identification fiscale *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez remplir']"
      >
      </q-input>
    <div class="q-gutter-sm justify-center ">
       <q-input
        v-model="info.Tva"
        type="number"
        step="any"
        min="1"
        label="TVA"
        :rules="[val => !!val || 'Obligatoire']"
      >
      </q-input>
    </div>
    <div class="q-gutter-sm justify-center ">
       <q-input
        v-model="info.TelOne"
        label="Téléphone"
        mask="## ## ## ## ##"
        fill-mask
        hint="Aide: ## ## ## ## ##"
        :rules="[val => !!val || 'Obligatoire']"
      >
      </q-input>
    </div>
    <div class="q-gutter-sm justify-center q-pb-xl">
       <q-input
        v-model="info.TelTwo"
        label="Téléphone"
        mask="## ## ## ## ##"
        fill-mask
        hint="Aide: ## ## ## ## ##"
      >
      </q-input>
    </div>

      <div class="q-pr-lg q-pt-xl q-pb-lg q-gutter-md absolute-bottom-right">
    <q-btn no-caps @click="edit = false" push color="red-8" label="Annuler" />
    <q-btn no-caps type="submit" push color="blue-grey-5"  label="Modifier" />
 </div>
    </q-form>
      </q-card-section>
        <q-card-section v-if="!edit" class="col-5 flex flex-center">
        <!--  <q-img
            class="rounded-borders"
            src="https://cdn.quasar.dev/img/parallax2.jpg"
          /> -->
        </q-card-section>


      <q-card-actions>
        <q-btn no-caps v-if="!edit" @click="fill" flat color="primary">
          Modifier
        </q-btn>
      </q-card-actions>
    </q-card>
</template>


<script>
import { mapActions, mapGetters } from 'vuex'
export default {
  data () {
    return {
      edit: false,
      info:{
        NumRegistreComm: '',
        NumArtImp: '',
        NumIdFisc: '',
        Tva: '',
        TelOne: '',
        TelTwo: '',
      }
    }
  },
  methods: {
    ...mapActions('company', ['setinfo','modifyinfo']),
    ...mapGetters('company', ['getinfo']),
    onSubmit () {
       this.edit = false
      this.modifyinfo(this.info)
          .then(response => {
            if(response){
              this.$q.notify({
                color: 'green-4',
                textColor: 'white',
                icon: 'cloud_done',
                message: 'Modifié'
              })
              this.setinfo()
            }
          })
      
    },
    fill () {
      this.edit = true
      this.info.NumRegistreComm = this.getallinfo[0].NumRegistreComm
      this.info.NumArtImp = this.getallinfo[0].NumArtImp
      this.info.NumIdFisc = this.getallinfo[0].NumIdFisc
      this.info.Tva = this.getallinfo[0].Tva
      this.info.TelOne = this.getallinfo[0].TelOne
      this.info.TelTwo = this.getallinfo[0].TelTwo
    }
  },
  computed: {
    getallinfo () {
      return this.getinfo()
    }
  },
  created () {
    this.setinfo()
  }
}
</script>

<style lang="scss" scoped>
</style>