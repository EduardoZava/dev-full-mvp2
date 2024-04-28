const usuario = require('./usuario')
const perfil = require('./perfil')
const endereco = require('./endereco')

 module.exports = {
    ...usuario,
    ...perfil,
    ...endereco,
 }