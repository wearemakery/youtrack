FROM azul/zulu-openjdk-debian:8

MAINTAINER Gyula Voros <gyulavoros87@gmail.com>

ENV YOUTRACK_VERSION 7.0.28110

WORKDIR /opt/youtrack

RUN apt-get update && apt-get install -y wget ca-certificates && \
    wget -q https://download-cf.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.jar && \
    mv youtrack-$YOUTRACK_VERSION.jar youtrack.jar && \
    apt-get autoremove -y wget && \
    rm -rf /var/cache/apt/archives

EXPOSE 8080
VOLUME ["/root/teamsysdata", "/root/teamsysdata-backup"]

CMD ["sh", "-c", "java -Xmx1g -XX:MaxPermSize=250m -Djava.awt.headless=true -Djetbrains.youtrack.baseUrl=$BASE_URL -jar youtrack.jar 8080"]
