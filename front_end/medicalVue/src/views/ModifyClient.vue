<template>

  <div class="q-pa-xl q-gutter-xl">
    <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Modifier les informations de {{getprofilee[0].nom}} {{getprofilee[0].prenom}}</div>
        </q-card-section>
        <q-separator />
            <q-form
      @submit.prevent="onSubmit"
      class="justify-center q-pa-lg"
    >
    <div class="text-h6">Informations de l'assuré</div>
      <q-input
        v-model="getprofilee[0].nom"
        type="text"
        class="q-pa-md"
        label="Nom *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper le nom']"
      >
      </q-input>
      <q-input
        v-model="getprofilee[0].prenom"
        type="text"
        class="q-pa-md"
        label="Prénom *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper le prénom']"
      >
      </q-input>
    <div class="q-gutter-sm justify-center q-pa-md">
       <q-input
        v-model="getprofilee[0].NumTel"
        label="N° de téléphone "
        mask="## ## ## ## ##"
        fill-mask
        lazy-rules
        hint="Aide: XX XX XX XX XX"
        :rules="[val => !!val || 'Obligatoire',
          val => val && val.length > 0  || 'veuillez remplir correctement']"
      >
      </q-input>
    </div>
    <div class="q-gutter-xl row justify-between q-pa-md">
      <q-select
        class="col"
        v-model="getprofilee[0].Caisse"
        :options="neworder.caisseoptions"
        label="Caisse"
        emit-value
        map-options
      />
      <q-select
        class="col"
        v-if="getprofilee[0].Caisse === 'CASNOS' || getprofilee[0].Caisse === 'CNAS'"
        v-model="getprofilee[0].Wilaya"
        :options="neworder.optionswilaya"
        label="Wilaya"
        emit-value
        map-options
      />
    </div>
    <div class="q-gutter-sm justify-center q-pa-md">
       <q-input
        v-if="getprofilee[0].Caisse === 'CASNOS' || getprofilee[0].Caisse === 'CNAS' || getprofilee[0].Caisse ==='CAMSSP'"
        v-model="getprofilee[0].NumSecSocial"
        label="N° sécurité sociale *"
        fill-mask
        lazy-rules
        hint="Aide: XX XXXX XXXX XX"
      >
      </q-input>
    </div>  <br>
      <div class=" q-pr-lg q-pt-xl q-pb-lg q-gutter-md absolute-bottom-right">
    <q-btn no-caps type="submit" push color="blue-grey-5" :loading="loading" :disabled="loading"  icon-right="send" label="Modifier le profile" >
      <template v-slot:loading>
        <q-spinner-hourglass class="on-left" />
        Chargement...
      </template>
    </q-btn>
      </div>
    </q-form>
        </q-card>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'

export default {
  data(){
    return {
      fill: false,
      remisestate: false,
      loading: false,
      neworder:{
        id: 1,
        nom: '',
        prenom: '',
        securitesociale: '',
        tel: '',
        numPermis: '',
        commande: null,
        wilaya: null,
        optionswilaya:[
          {
              label:"ADRAR",
              value:"ADRAR"
          },
          {
              label:"CHLEF",
              value:"CHLEF"
          },
          {
              label:"LAGHOUAT",
              value:"LAGHOUAT"
          },
          {
              label:"OUM EL BOUAGHI",
              value:"OUM EL BOUAGHI"
          },
          {
              label:"BATNA",
              value:"BATNA"
          },
          {
              label:"BEJAIA",
              value:"BEJAIA"
          },
          {
              label:"BISKRA",
              value:"BISKRA"
          },
          {
              label:"BECHAR",
              value:"BECHAR"
          },
          {
              label:"BLIDA",
              value:"BLIDA"
          },
          {
              label:"BOUIRA",
              value:"BOUIRA"
          },
          {
              label:"TAMANRASSET",
              value:"TAMANRASSET"
          },
          {
              label:"TEBESSA",
              value:"TEBESSA"
          },
          {
              label:"TLEMCEN",
              value:"TLEMCEN"
          },
          {
              label:"TIARET",
              value:"TIARET"
          },
          {
              label:"TIZI OUZOU",
              value:"TIZI OUZOU"
          },
          {
              label:"ALGER",
              value:"ALGER"
          },
          {
              label:"DJELFA",
              value:"DJELFA"
          },
          {
              label:"JIJEL",
              value:"JIJEL"
          },
          {
              label:"SETIF",
              value:"SETIF"
          },
          {
              label:"SAIDA",
              value:"SAIDA"
          },
          {
              label:"SKIKDA",
              value:"SKIKDA"
          },
          {
              label:"SIDI BEL ABBES",
              value:"SIDI BEL ABBES"
          },
          {
              label:"ANNABA",
              value:"ANNABA"
          },
          {
              label:"GUELMA",
              value:"GUELMA"
          },
          {
              label:"CONSTANTINE",
              value:"CONSTANTINE"
          },
          {
              label:"MEDEA",
              value:"MEDEA"
          },
          {
              label:"MOSTAGANEM",
              value:"MOSTAGANEM"
          },
          {
              label:"M'SILA",
              value:"M'SILA"
          },
          {
              label:"MASCARA",
              value:"MASCARA"
          },
          {
              label:"OUARGLA",
              value:"OUARGLA"
          },
          {
              label:"ORAN",
              value:"ORAN"
          },
          {
              label:"EL BAYDH",
              value:"EL BAYDH"
          },
          {
              label:"ILLIZI",
              value:"ILLIZI"
          },
          {
              label:"BORDJ BOU ARRERIDJ",
              value:"BORDJ BOU ARRERIDJ"
          },
          {
              label:"BOUMERDES",
              value:"BOUMERDES"
          },
          {
              label:"EL TAREF",
              value:"EL TAREF"
          },
          {
              label:"TINDOUF",
              value:"TINDOUF"
          },
          {
              label:"TISSEMSILT",
              value:"TISSEMSILT"
          },
          {
              label:"EL OUED",
              value:"EL OUED"
          },
          {
              label:"KHENCHLA",
              value:"KHENCHLA"
          },
          {
              label:"SOUK AHRASS",
              value:"SOUK AHRASS"
          },
          {
              label:"TIPAZA",
              value:"TIPAZA"
          },
          {
              label:"MILA",
              value:"MILA"
          },
          {
              label:"AIN DEFLA",
              value:"AIN DEFLA"
          },
          {
              label:"NAAMA",
              value:"NAAMA"
          },
          {
              label:"AIN TEMOUCHENT",
              value:"AIN TEMOUCHENT"
          },
          {
              label:"GHARDAIA",
              value:"GHARDAIA"
          },
          {
              label:"RELIZANE",
              value:"RELIZANE"
          }
        ],
        caisse: '',
        caisseoptions: [
          {
            label: 'CASH',
            value: 'CASH'
          },
          {
            label: 'CNAS',
            value: 'CNAS'
          },
          {
            label: 'CASNOS',
            value: 'CASNOS'
          },
          {
            label: 'CAMSSP',
            value: 'CAMSSP'
          }
        ],
        cash: 0,
        remise: null
      },
      model: null,
    }
  },
  
  methods: {
    ...mapActions('devis', ['modifyprofile', 'setProfile']),
      ...mapGetters('devis',['getprofile']),
    onSubmit(){
          this.loading = true
          this.modifyprofile(this.getprofilee[0])
        .then(Response => {
          if(Response){
            this.loading = false
            this.$router.replace({
            name: 'ListUsers'
          })
            this.$q.notify({
                color: 'green-4',
                textColor: 'white',
                icon: 'done',
                message: 'Profile modifié !'
            })
          }
        })
        .catch(err => {
            this.loading = false
          console.log(err)
            this.$q.notify({
                color: 'red-4',
                textColor: 'white',
                icon: 'clear',
                message: 'Profile non modifié !'
            })
        })
        }
  },
  watch: {
    getprofilee: {
      deep: true,
      handler (val) {
        if (val[0].Caisse === 'CAMSSP' || val[0].Caisse === 'CASH') {
          val[0].Wilaya = ''
          val[0].NumSecSocial = ''
        }
      }
    }
  },
  computed:{
    getprofilee(){
      return this.getprofile()
    }
  },
  created(){
    this.setProfile(this.$route.params.id)
   // this.filll()
  }
}
</script>

<style>

</style>