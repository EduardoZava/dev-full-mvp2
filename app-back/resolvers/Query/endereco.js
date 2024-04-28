const db = require('../../config/db')

module.exports = {
    endereco(parent, args, ctx) {
        ctx //&& ctx.validarAdmin()
        return db('endeeco')
    },
    endereco(_, { filtro }, ctx) {
        ctx //&& ctx.validarUsuarioFiltro(filtro)
        
        if(!filtro) return null
        const { id } = filtro
        if(id) {
            return db('endereco')
                .where({ id })
                .first()
        } else {
            return null
        }
    },
}