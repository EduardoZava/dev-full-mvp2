

##instalação do BD##

docker pull mysql

##para acessar este banco por root remotamente no dbeaver
jdbc:mysql://0.0.0.0:3306/mydb?allowPublicKeyRetrieval=True

docker run --name mydb -p 3306:3306 -e MYSQL_DATABASE=mydb -e MYSQL_ROOT_PASSWORD=xpto1234 -d mysql:latest

https://github.com/knex/knex/issues/3233 referencia aum erro no knex ao rodar os migration
tive que instalar um client: 'mysql2' https://www.npmjs.com/package/mysql2
npm install --save mysql2

#para execução das criacao de tabelas
npx knex migrate:latest 

#executa a api backend
npm run start
#e o apollo server irá executar nesta porta 
http://localhost:4000/

docker exec -it container_id //bin//sh


https://forums.docker.com/t/how-to-create-a-network-of-containers-that-can-communicate-with-each-other-interchangably/134292/2



