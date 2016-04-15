FROM java:openjdk-7-jdk

ARG PLAY_VERSION

ENV GIT_REPO ''
ENV CREDENTIALS ''
ENV DB_TYPE ''
ENV DB_HOST ''
ENV DB_PORT ''
ENV DB_NAME ''
ENV DB_USER ''
ENV DB_PASSWORD ''

RUN apt-get install unzip git curl 
RUN wget https://downloads.typesafe.com/play/${PLAY_VERSION}/play-${PLAY_VERSION}.zip
RUN unzip play-${PLAY_VERSION}.zip -d /usr/local/ && rm play-${PLAY_VERSION}.zip && chmod a+x /usr/local/play-${PLAY_VERSION}/play
RUN ln -s /usr/local/play-${PLAY_VERSION}/play /usr/local/bin/play

COPY ./start.sh /usr/local/bin/

CMD ["/usr/local/bin/start.sh"] 
