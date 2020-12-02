<template>
  <q-card class="my-card">
        <q-card-section class="bg-blue-grey-5 text-white">
            <div class="text-h6">Historique des achats</div>
        </q-card-section>

        <q-separator />

        <q-card-actions>
<table>
  <tr>
    <th>Nom produit</th>
    <th>Nom client</th>
    <th>montant</th>
  </tr>
  <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria Anders</td>
    <td>100 Da</td>
  </tr>
  <tr>
    <td>Centro comercial Moctezuma</td>
    <td>Francisco Chang</td>
    <td>200 Da</td>
  </tr>
  <tr>
    <td>Ernst Handel</td>
    <td>Roland Mendel</td>
    <td>300 Da</td>
  </tr>
  <tr>
    <td>Island Trading</td>
    <td>Helen Bennett</td>
    <td>400 Da</td>
  </tr>
  <tr>
    <td>Laughing Bacchus Winecellars</td>
    <td>Yoshi Tannamuri</td>
    <td>500 Da</td>
  </tr>
  <tr>
    <td>Magazzini Alimentari Riuniti</td>
    <td>Giovanni Rovelli</td>
    <td>600 Da</td>
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