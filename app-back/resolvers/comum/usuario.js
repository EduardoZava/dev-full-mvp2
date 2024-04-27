const jwt = require('jwt-simple')
const { perfis: obterPerfis } = require('../Type/Usuario')
const secrets = require('../../secretss')   // Import the secrets module

module.exports = {
    async getUsuarioLogado(usuario) {
        const perfis = await obterPerfis(usuario)
        const agora = Math.floor(Date.now() / 1000)

        const usuarioInfo = {
            id: usuario.id,
            nome: usuario.nome,
            email: usuario.email,
            perfis: perfis.map(p => p.nome),
            iat: agora,
            exp: agora + (3 * 24 * 60 * 60)
        }

        const authSecret = secrets.APP_AUTH_SECRET // Get the APP_AUTH_SECRET from the secrets module
        console.log(authSecret) // Log the authSecret variable
        return {
            ...usuarioInfo,
            token: jwt.encode(usuarioInfo,authSecret)
        }
    }
}