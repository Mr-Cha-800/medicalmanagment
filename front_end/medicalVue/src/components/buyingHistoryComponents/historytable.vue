<template>
  <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Historique des achats</div>
        </q-card-section>

        <q-separator />

        <q-card-actions class="q-pa-xl">
<table>
  <tr>
    <th>ref Produit</th>
    <th>Nom</th>
    <th>Description</th>
    <th>prix</th>
    <th></th>
  </tr>
  <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria Anders</td>
    <td>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Commodi explicabo illo amet, rem, tenetur ipsam vero dolores quae esse nihil quis molestias iusto voluptatibus veritatis beatae labore harum libero officiis?</td>
    <td>100 Da</td>
    <td><q-btn round flat><q-icon color="red" @click="deletee"  name="delete"/><q-tooltip>supprimer</q-tooltip></q-btn></td>
  </tr>
  <tr>
    <td>Centro comercial Moctezuma</td>
    <td>Francisco Chang</td>
    <td>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Commodi explicabo illo amet, rem, tenetur ipsam vero dolores quae esse nihil quis molestias iusto voluptatibus veritatis beatae labore harum libero officiis?</td>
    <td>200 Da</td>
    <td><q-btn round flat><q-icon color="red" @click="deletee"  name="delete"/><q-tooltip>supprimer</q-tooltip></q-btn></td>
  </tr>
  <tr>
    <td>Ernst Handel</td>
    <td>Roland Mendel</td>
    <td>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Commodi explicabo illo amet, rem, tenetur ipsam vero dolores quae esse nihil quis molestias iusto voluptatibus veritatis beatae labore harum libero officiis?</td>
    <td>300 Da</td>
    <td><q-btn round flat><q-icon color="red" @click="deletee"  name="delete"/><q-tooltip>supprimer</q-tooltip></q-btn></td>
  </tr>
  <tr>
    <td>Island Trading</td>
    <td>Helen Bennett</td>
    <td>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Commodi explicabo illo amet, rem, tenetur ipsam vero dolores quae esse nihil quis molestias iusto voluptatibus veritatis beatae labore harum libero officiis?</td>
    <td>400 Da</td>
    <td><q-btn round flat><q-icon color="red" @click="deletee"  name="delete"/><q-tooltip>supprimer</q-tooltip></q-btn></td>
  </tr>
  <tr>
    <td>Laughing Bacchus Winecellars</td>
    <td>Yoshi Tannamuri</td>
    <td>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Commodi explicabo illo amet, rem, tenetur ipsam vero dolores quae esse nihil quis molestias iusto voluptatibus veritatis beatae labore harum libero officiis?</td>
    <td>500 Da</td>
    <td><q-btn round flat><q-icon color="red" @click="deletee"  name="delete"/><q-tooltip>supprimer</q-tooltip></q-btn></td>
  </tr>
  <tr>
    <td>Magazzini Alimentari Riuniti</td>
    <td>Giovanni Rovelli</td>
    <td>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Commodi explicabo illo amet, rem, tenetur ipsam vero dolores quae esse nihil quis molestias iusto voluptatibus veritatis beatae labore harum libero officiis?</td>
    <td>600 Da</td>
    <td><q-btn round flat><q-icon color="red" @click="deletee"  name="delete"/><q-tooltip>supprimer</q-tooltip></q-btn></td>
  </tr>
</table>
        </q-card-actions>
        </q-card>
</template>

<script>
export default {

}
</script>

<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

</style>