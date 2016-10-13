FROM wearemakery/zulu-jdk-opensuse

MAINTAINER Gyula Voros <gyulavoros87@gmail.com>

ENV YOUTRACK_VERSION 7.0.27705

VOLUME ["/root/teamsysdata", "/root/teamsysdata-backup"]

RUN zypper -n in wget \
  && wget --no-check-certificate -q -P /opt/youtrack https://download-cf.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.jar \
  && zypper -n rm wget \
  && zypper clean

EXPOSE 8080
WORKDIR /opt/youtrack
CMD ["sh", "-c", "java -Xmx1g -XX:MaxPermSize=250m -Djava.awt.headless=true -Djetbrains.youtrack.baseUrl=$BASE_URL -jar youtrack-$YOUTRACK_VERSION.jar 8080"]
