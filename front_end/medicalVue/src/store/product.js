import axios from 'axios'
export default {
    namespaced: true,
    state:{
        order: {},
        product: {},
        products: {}
    },
    getters:{
        showoneproduct(state){
            return state.product
        },
        getproducts(state){
            return state.products
        }
    },
    mutations:{
        showproduct(state, product){
            state.product = product
        },
        getallproducts(state, products){
            state.products = products
        }
    },
    actions:{
        async newproduct(_, product){
            return new Promise((resolve, reject) => {
                axios.post('/produits', {
                    NumRef: product.refId,
                    Designation: product.nomProduit,
                    PrixU: product.montantProduit,
                    Tva: product.Tva
                })
                  .then(response => {
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async getallproducts({ commit }){
            return new Promise((resolve, reject) => {
                axios.get('/produits')
                  .then(response => {
                      commit('getallproducts', response.data)
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async getallproductsforgestion({ commit }){
            return new Promise((resolve, reject) => {
                axios.get('/produits/gestion')
                  .then(response => {
                      commit('getallproducts', response.data)
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async showproduct({ commit }, id){
            return await new Promise((resolve, reject) => {
                axios.get('/produits/'+ id)
                  .then(response => {
                      commit('showproduct', response.data)
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async modifyproduct(_, product){
            return new Promise((resolve, reject) => {
                axios.patch('/produits/' + product.NumRef, {
                    NumRef: product.NumRef,
                    Designation: product.Designation,
                    PrixU: product.PrixU,
                    Tva: product.tax
                })
                  .then(response => {
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async deleteproduct({ dispatch }, id){
            return new Promise((resolve, reject) => {
                axios.delete('/produits/'+ id)
                  .then(response => {
                      dispatch('getallproducts')
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async searchproducts({ commit }, search){
          search = '%'+search+'%'
            return new Promise((resolve, reject) => {
                axios.post('/produits/recherche', {
                  Search : search
                })
                  .then(response => {
                      commit('getallproducts', response.data)
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        }
    }
}