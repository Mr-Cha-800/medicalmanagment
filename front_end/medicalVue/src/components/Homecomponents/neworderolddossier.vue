<template>

  <div class="q-pa-xl q-gutter-xl">
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
        v-model="neworder.tel"
        label="N° de téléphone "
        mask="## ## ## ## ##"
        fill-mask
        lazy-rules
        hint="Aide: XX XX XX XX XX">
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
    <div class="q-gutter-sm justify-center q-pa-md">
       <q-input
        v-if="neworder.caisse === 'CASNOS' || neworder.caisse === 'CNAS' || neworder.caisse ==='CAMSSP'"
        v-model="neworder.securitesociale"
        label="N° sécurité sociale *"
        fill-mask
        lazy-rules
        hint="Aide: XX XXXX XXXX XX"
      >
      </q-input>
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
        <th style="width:120px">N° Réf.</th>
        <th>Désignation</th>
        <th style="width:140px">Prix unitaire</th>
        <th style="width:60px">TVA</th>
        <th style="width:60px">QTE</th>
        <th style="width:140px">Montant H.T</th>
        <th style="width:140px">Montant T.T.C</th>
      </tr>
      <tr v-for="product in neworder.commande" :key="product.id">
        <td>{{product.NumRef}}</td>
        <td >{{product.Designation}}  </td>
        <td > {{formatthis(product.PrixU)}} Da</td>
        <td v-if="product.tax === 1">{{getinfo[0].Tva}} %</td>
        <td v-else>{{product.tax}} %</td>
        <td><q-input type="number" step="any" min="1" lazy-rules  v-model="product.quantity"/></td>
        <td>{{formatthis((product.quantity*product.PrixU).toFixed(2))}} Da</td>
        <td v-if="product.tax === 0">{{formatthis((product.quantity*(product.PrixU+((product.PrixU*product.tax)/100))).toFixed(2))}} Da</td>
        <td v-else-if="product.tax === 1">{{formatthis((product.quantity*(product.PrixU+((product.PrixU*getinfo[0].Tva)/100))).toFixed(2))}} Da</td>
      </tr>
    </table>
    </div>
      <!--<q-toggle
        v-model="neworder.cash"
        :true-value="1"
        :false-value="0"
        color="blue-grey-5"
        label="Cash"
      /> -->
      <q-toggle
        v-model="remisestate"
        color="blue-grey-5"
        label="Remise"
      />
      
    <div class="q-gutter-sm justify-center q-pa-lg  q-pb-xl">
       <q-input
        type="number"
        step="any"
        min="0"
        max="100"
        v-if="remisestate"
        v-model="neworder.remise"
        label="Remise en %"
      >%
      </q-input>
      <div>
        <p v-if="remisestate && neworder.remise > 0">REMISE : {{formatthis(remisetaux.toFixed(2))}} DA</p>
        <p v-else-if="remisestate">REMISE : 0 DA</p>
        <p v-if="neworder.caisse === 'CNAS' || neworder.caisse === 'CASNOS' || neworder.caisse === 'CAMSSP'">TVA : {{formatthis(ttctaux.toFixed(2))}} DA</p>
        <p v-else>TVA : 0 DA</p>
        <p v-if="finalprice">PRIX à PAYER : {{formatthis(finalprice.toFixed(2))}} DA </p>
      </div>
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
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
var numberFormatter = require("number-formatter")

export default {
  data(){
    return {
      ttctaux:0,
      remisetaux: 0,
      finalprice: 0,
      fill: false,
      remisestate: false,
      loading: false,
      afterhours: null,
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
        patient:{
          nom: '',
          prenom: '',
          datenaiss: '',
          lieunaissance: ''
        },
        cash: 0,
        remise: null
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
          if(error.response.status === 406){
              
          this.$q.notify({
              color: 'red-4',
              textColor: 'white',
              icon: 'clear',
              message: "Numero de téléphone existe deja ! Veuillez choisir 'client existant'"
            })
          }
        console.log(error)
      })
    },
    filll(){
        this.neworder.id = this.getuser[0].ID
        this.neworder.nom = this.getuser[0].nom
        this.neworder.prenom = this.getuser[0].prenom
        this.neworder.securitesociale = this.getuser[0].NumSecSocial
        this.neworder.tel = this.getuser[0].NumTel
        this.neworder.wilaya = this.getuser[0].Wilaya
        this.neworder.caisse = this.getuser[0].Caisse
    },
    formatthis(x){
      return numberFormatter("### ### ###.00", x)
    },
      calculatefinal(){
        var montanttotal = 0
        if(this.neworder.caisse === 'CASH'){
        for(var k=0; k < this.neworder.commande.length; k++) {
          montanttotal = montanttotal + (this.neworder.commande[k].PrixU * this.neworder.commande[k].quantity)
      }
      this.remisetaux = (montanttotal * this.neworder.remise)/100
      this.finalprice = montanttotal - ((montanttotal * this.neworder.remise)/100)
        }else if(this.neworder.caisse !== 'CASH'){

        for(k=0; k < this.neworder.commande.length; k++) {
          montanttotal = montanttotal + (this.neworder.commande[k].PrixU * this.neworder.commande[k].quantity)
          this.remisetaux = (montanttotal * this.neworder.remise)/100
      this.finalprice = montanttotal - ((montanttotal * this.neworder.remise)/100)
      this.ttctaux = (this.finalprice * this.neworder.commande[k].tax * this.getinfo[0].Tva)/100
      this.finalprice = this.finalprice + this.ttctaux
      }
      
      
        }
    }
  },
  watch: {
    neworder: {
      deep: true,
      handler (val) {
        if ( val.caisse === 'CASH') {
          val.wilaya = ''
          val.securitesociale = ''
        }
        if ( val.caisse === 'CAMSSP' ) {
          val.wilaya = ''
        }
        if ((val.nom || val.prenom ) && this.fill === true){
        this.neworder.patient.nom = this.neworder.nom
        this.neworder.patient.prenom = this.neworder.prenom
        }
        if(val.commande){
          this.calculatefinal()
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
    },
    remisestate: function(){
      if(this.remisestate === false){
        this.remisetaux = 0
        this.neworder.remise = 0
      }
    },
  },
  computed:{
    ...mapGetters('product', ['getproducts']),
    ...mapGetters('devis', ['getuser']),
    ...mapGetters('company', ['getinfo'])
  },
  created(){
    this.filll()
    this.getallproducts()
  }
}
</script>

<style>

</style>