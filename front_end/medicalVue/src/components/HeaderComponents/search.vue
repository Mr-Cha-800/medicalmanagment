<template>
        <q-input dark dense standout placeholder="Search products..." v-model="text" input-class="text-left" class="q-ml-md">
          <template v-slot:append>
            <q-icon v-if="text === ''" name="search" />
            <q-icon v-else name="clear" class="cursor-pointer" @click="text = ''" />
          </template>
        </q-input>
</template>
<script>
export default {
    name:'Search',
    data(){
        return {
            text: ''
        }
    }
}
</script>