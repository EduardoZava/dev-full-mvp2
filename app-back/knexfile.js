require('dotenv').config()

module.exports = {
  client: 'mysql2',
  connection: {
    
    port: process.env.APP_DB_PORT,
    database: process.env.APP_DB_NAME,
    user: process.env.APP_DB_USER,
    password: process.env.APP_DB_PASSWORD,
    host: process.env.APP_DB_HOST
    /*
    port: 3306,
    database: 'mydb',
    user: 'root',
    password: 'xpto1234',
    host: '0.0.0.0'
    */
  },
  pool: {
    min: 2,
    max: 10
  },
  migrations: {
    tableName: 'knex_migrations'
  }
};
