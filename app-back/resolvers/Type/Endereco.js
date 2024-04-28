const db = require('../../config/db')
const { join } = require('path'); // Add the missing import statement for the 'join' function


//module.exports = {
//    enderecos(usuario) {
//        return db('endereco')
//           .join(
//               'id',
//                'usuarios_id',
//    
//            )
//           .where({ usuario__id: usuario.id })
//   }
//}