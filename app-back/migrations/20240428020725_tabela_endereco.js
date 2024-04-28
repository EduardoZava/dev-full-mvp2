
exports.up = function(knex, Promise) {
    return knex.schema.createTable('endereco', table => {
        table.increments('id').primary()
        table.string('CEP').notNull()
        table.string('logradouro').notNull()
        table.string('numero').notNull()
        table.string('complemento').notNull()
        table.string('bairro').notNull()
        table.string('cidade').notNull()
        table.string('estado').notNull()
        table.integer('usuario_id').references('id')
    })
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('endereco')
};
