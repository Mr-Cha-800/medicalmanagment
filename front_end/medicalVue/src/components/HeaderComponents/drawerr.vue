<template>

        <q-drawer
          v-model="leftDrawerOpen"
          bordered
          overlay
          :width="250"
          :breakpoint="400"
        >
        <q-scroll-area style="height: calc(100% - 150px); margin-top: 150px; border-right: 1px solid #ddd">
          <q-list padding>
            <q-item  :to="{ name: 'Searchh', params: { t: 'SC' }}"  clickable v-ripple>
              <q-item-section avatar>
                <q-icon name="event" />
              </q-item-section>
              <q-item-section>
                E-mails
              </q-item-section>
            </q-item>
            <q-item  :to="{ name: 'Searchh', params: { t: 'SC' }}"  clickable v-ripple>
              <q-item-section avatar>
                <q-icon name="event" />
              </q-item-section>
              <q-item-section>
                E-mails
              </q-item-section>
            </q-item>
            <q-item  :to="{ name: 'Searchh', params: { t: 'SC' }}"  clickable v-ripple>
              <q-item-section avatar>
                <q-icon name="event" />
              </q-item-section>
              <q-item-section>
                E-mails
              </q-item-section>
            </q-item>
          </q-list>
        </q-scroll-area>
        <q-img class="absolute-top" src="https://cdn.quasar.dev/img/material.png" style="height: 150px">
          <div class="absolute-bottom bg-transparent">
            <q-avatar size="56px" class="q-mb-sm">
              <img src="https://cdn.quasar.dev/img/boy-avatar.png">
            </q-avatar>
            <div class="text-weight-bold">MR howa</div>
            <div>CEO</div>
          </div>
        </q-img>
    </q-drawer>
</template>
<script>
export default {
    props: {
        leftDrawerOpen:{
            type: Boolean,
            required: true
        }
    }
}
</script>