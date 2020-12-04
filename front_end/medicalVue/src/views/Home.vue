<template>
   <div class="q-pa-md">
   <div class="row q-pa-md justify-center full-height full-width text-center">
    <div class="col-md-5 col-sm-6 col-xs-12 q-pa-md">
        <search/>
    </div>
    <div class="col-md-5 col-sm-6 col-xs-12 q-pa-md">
    <q-btn no-caps color="red-8" icon-right="add_shopping_cart" label="Gestion de produit" />
    </div>
   </div>
   <div class="row q-pa-md justify-center full-height full-width text-center">
    <div class="col-md-5 col-sm-6 col-xs-12 q-pa-md">
        <newdevis/>
    </div>
    <div class="col-md-5 col-sm-6 col-xs-12 q-pa-md">
        <buyinghistory/>
    </div>
   </div>
</div>
</template>
<script>
import buyinghistory from '../components/Homecomponents/buyinghistory'
import newdevis from '../components/Homecomponents/newdevis'
import search from '../components/Homecomponents/search'
export default {
    name: 'Home',
    components: { 
        buyinghistory,
        newdevis,
        search
        }

}
</script>
