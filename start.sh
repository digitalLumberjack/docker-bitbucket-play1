#!/bin/bash -e

cd /usr/share/
git clone "https://x-token-auth:$(curl -X POST -u "${CREDENTIALS}" https://bitbucket.org/site/oauth2/access_token -d grant_type=client_credentials | grep -Po '(?<="access_token": ")[^"]*')@bitbucket.org/${GIT_REPO}" application

cd application
if [[ "${SUBMODULE}" != "" ]];then
  cd "${SUBMODULE}"
fi

play start --http.port=9007 --%prod \
--prod.application.mode=prod \
--prod.db.url="jdbc:${DB_TYPE}://${DB_HOST}:${DB_PORT}/${DB_NAME}" \
--prod.db.driver=${DB_DRIVER} \
--prod.db.user=${DB_USER} \
--prod.db.pass="${DB_PASSWORD}"


#target/universal/stage/bin/`ls target/universal/stage/bin/ | head -n1` \
#-Dapplication.secret=${APPLICATION_SECRET} \
#-Dapplication.home=/usr/share/application/ \
#-Dplay.evolutions.db.default.autoApply=${EVOLUTION_ENABLED} \
#-Dslick.dbs.default.db.url="jdbc:${DB_TYPE}://${DB_HOST}:${DB_PORT}/${DB_NAME}" \
#-Dslick.dbs.default.db.user=${DB_USER} \
#-Dslick.dbs.default.db.password="${DB_PASSWORD}" 

