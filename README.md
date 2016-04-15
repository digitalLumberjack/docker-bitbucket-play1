# docker-bitbucket-play

Create a play 1 container, pulling and executing a play 1 application on bitbucket.org.  

Use the following ENV when running : 

- PLAY_VERSION : play version (default : 1.2.6.2)
- CREDENTIALS : you oauth credentials, composed of key and secret (key:secret)
- GIT_REPO : the git repository to clone (user/repo)
- APPLICATION_SECRET : the application secret
- EVOLUTION_ENABLED : true or false
- DB_TYPE : mysql, postgres
- DB_HOST : host fqdn or ip
- DB_PORT : port of database server
- DB_NAME : name of the base to connect
- DB_USER : username to connect the database
- DB_PASSWORD : password to connect the database

Run with a docker-compose or directly by linking the db container in command line.
