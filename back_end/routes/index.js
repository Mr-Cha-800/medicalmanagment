module.exports = (app) => {
    app.use("/produits",require('./produits'))
    app.use("/info",require('./info'))
    app.use("/factures",require('./factures'))
}