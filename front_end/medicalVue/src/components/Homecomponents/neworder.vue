<template>
    <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Nouvelle commande</div>
        </q-card-section>

        <q-separator />
            <q-form
      @submit.prevent="onSubmit"
      class="justify-center q-pa-lg"
    >
    <div class="text-h6">Informations de l'assuré</div>
      <q-input
        v-model="neworder.nom"
        type="text"
        class="q-pa-md"
        label="Nom *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper le nom']"
      >
      </q-input>
      <q-input
        v-model="neworder.prenom"
        type="text"
        class="q-pa-md"
        label="Prénom *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper le prénom']"
      >
      </q-input>
    <div class="q-gutter-sm justify-center q-pa-md">
       <q-input
        v-model="neworder.securitesociale"
        label="N° sécurité sociale *"
        mask="## #### #### ##"
        fill-mask
        lazy-rules
        hint="Aide: XX XXXX XXXX XX"
        :rules="[val => !!val || 'Obligatoire',
          val => val && val.length > 0  || 'veuillez remplir correctement']"
      >
      </q-input>
    </div>
    <div class="q-gutter-sm justify-center q-pa-md">
       <q-input
        v-model="neworder.tel"
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
        v-model="neworder.caisse"
        :options="neworder.caisseoptions"
        label="Caisse"
        emit-value
        map-options
      />
      <q-select
        class="col"
        v-if="neworder.caisse === 'CASNOS' || neworder.caisse === 'CNAS'"
        v-model="neworder.wilaya"
        :options="neworder.optionswilaya"
        label="Wilaya"
        emit-value
        map-options
      />
    </div>
    <div class="row">
      <div class="col"><div class="text-h6">Informations du patient</div> </div>
      <div class="col">
      <q-toggle
        v-model="fill"
        color="blue-grey-5"
        label="Remplissage automatique"
      />
      </div>
    </div>
    <q-input
        v-model="neworder.patient.nom"
        type="text"
        class="q-pa-md"
        label="Nom *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper le nom']"
      >
      </q-input>
      <q-input
        v-model="neworder.patient.prenom"
        type="text"
        class="q-pa-md"
        label="Prénom *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez taper le prénom']"
      >
      </q-input>
    <div class="row q-gutter-xl q-pa-md">
      <q-input 
        lazy-rules
        hint="Date de naissance *"
        :rules="[ val => val && val.length > 0 || 'veuillez taper le prénom']"
        format="DD-MM-YYYY" 
        type="date"
        class="col"
        formatModel="string" 
        v-model="neworder.patient.datenaiss">
    </q-input>
      <q-input
        v-model="neworder.patient.lieunaissance"
        type="text"
        class="col"
        hint="Lieu de naissance *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'veuillez remplir']"
      >
        <template v-slot:prepend>
         À
        </template>
      </q-input>
    </div>
    <div class="text-h6">Produit</div>
    <div class="q-pa-md">
    <q-select
      v-model="neworder.commande"
      label="Désignation/Référence du produit"
      use-input
      use-chips
      multiple
      input-debounce="0"
      @new-value="createValue"
      :options="filterOptions"
      @filter="filterFn"
      option-label = "Designation"
      emit-value
      map-options
    >
       <template v-slot:option="scope">
          <q-item
            v-bind="scope.itemProps"
            v-on="scope.itemEvents"
          >
            <q-item-section>
              <q-item-label v-html="scope.opt.Designation" />
              <q-item-label caption>{{ scope.opt.NumRef }}</q-item-label>
            </q-item-section>
          </q-item>
        </template>
    </q-select>
  </div>
    <div class="q-pa-lg q-pb-xl">
    <table>
      <tr>
        <th style="width:20%">N° Réf.</th>
        <th style="width:80%">Désignation</th>
        <th style="width:20%">Prix unitaire</th>
        <th style="width:20%">Quantité</th>
        <th>Montant</th>
      </tr>
      <tr v-for="product in neworder.commande" :key="product.id">
        <td>{{product.NumRef}}</td>
        <td style="width:80%">{{product.Designation}}  </td>
        <td>{{product.PrixU}} Da</td>
        <td style="width:20%"><q-input type="number" min="1" lazy-rules :rules="[ val => val >= 1 || '1 ou plus' ]" v-model="product.quantity"/></td>
        <td>{{product.quantity*product.PrixU}} Da</td>
      </tr>
    </table>
    </div>
      <div class="q-pr-lg q-pt-xl q-pb-lg q-gutter-md absolute-bottom-right">
    <q-btn no-caps type="submit" push color="blue-grey-5" :loading="loading" :disabled="loading"  icon-right="send" label="Générer le devis" >
      <template v-slot:loading>
        <q-spinner-hourglass class="on-left" />
        Chargement...
      </template>
    </q-btn>
      </div>
    </q-form>
        </q-card>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'

export default {
  data(){
    return {
      fill: false,
      loading: false,
      neworder:{
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
              label:"OUM EL BOUGHI",
              value:"OUM EL BOUGHI"
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
            label: '',
            value: ''
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
            label: 'MILITAIRE',
            value: 'MILITAIRE'
          }
        ],
        patient:{
          nom: '',
          prenom: '',
          datenaiss: '',
          lieunaissance: ''
        }
      },
      model: null,
      filterOptions: this.getproducts
    }
  },
  
  methods: {
    ...mapActions('order', ['order']),
    ...mapActions('product', ['getallproducts']),
    createValue (val, done) {
      if (val.length > 2) {
        if (!this.getproducts.includes(val)) {
          done(val, 'add-unique')
        }
      }
    },

    filterFn (val, update) {
      let vm = this.getproducts
      update(() => {
        if (val === '') {
          this.filterOptions = vm
        }
        else {
          const needle = val.toLowerCase()
          this.filterOptions = vm.filter(
            v => v.Designation.toLowerCase().indexOf(needle) > -1 || v.NumRef.toLowerCase().indexOf(needle) > -1 
          )
        }
      })
    },
    onSubmit(){
      this.order(this.neworder)
      .then(response => {
        if(response){
            this.$router.replace({
            name: 'Gestiondevis'
          })
          this.$q.notify({
              color: 'green-4',
              textColor: 'white',
              icon: 'cloud_done',
              message: "Devis Fait"
            })
          }
      }).catch(error => {
        console.log(error)
      })
    }
  },
  watch: {
    neworder: {
      deep: true,
      handler (val) {
        if (val.caisse === 'MILITAIRE' || val.caisse === '') {
          val.wilaya = ''
        }
        if ((val.nom || val.prenom ) && this.fill === true){
        this.neworder.patient.nom = this.neworder.nom
        this.neworder.patient.prenom = this.neworder.prenom

        }
      }
    },
    fill: function(){
      if(this.fill === true) {
        this.neworder.patient.nom = this.neworder.nom
        this.neworder.patient.prenom = this.neworder.prenom
      }
      if(this.fill === false) {
        this.neworder.patient.nom = ''
        this.neworder.patient.prenom = ''
      }
    }
  },
  computed:{
    ...mapGetters('product', ['getproducts'])
  },
  created(){
    this.getallproducts()
  }
}
</script>

<style>

</style>