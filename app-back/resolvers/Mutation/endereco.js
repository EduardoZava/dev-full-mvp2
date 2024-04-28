const db = require('../../config/db')
const { endereco: obterEndereco } = require('../Query/endereco')

module.exports = {
    async novoEndereco(_, { dados }, ctx) {
        ctx //&& ctx.validarAdmin()
       
        try {
            const [ id ] = await db('endereco')
                .insert(dados)
            return db('endereco')
                .where({ id }).first()
        } catch(e) {
            throw new Error(e.sqlMessage)
        }
    },
    async excluirEndereco(_, args, ctx) {
        ctx //&& ctx.validarAdmin()

        try {
            const enderco = await obterEndereco(_, args)
            if(endereco) {
                const { id } = endereco
                await db('endereco')
                    .where({ id }).delete()
            }
            return endereco
        } catch(e) {
            throw new Error(e.sqlMessage)
        }
    },
    async alterarEndereco(_, { filtro, dados }, ctx) {
        ctx //&& ctx.validarAdmin()
        try {
            const enderco = await obterEndereco(_, { filtro })
            if(enderco) {
                const { id } = endereco
                await db('endereco')
                    .where({ id })
                    .update(dados)
            }
            return { ...endereco, ...dados }
        } catch(e) {
            throw new Error(e.sqlMessage)
        }
    }
}