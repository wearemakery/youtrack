FROM wearemakery/zulu-jdk-opensuse

MAINTAINER Gyula Voros <gyulavoros87@gmail.com>

ENV YOUTRACK_VERSION 6.5.16981

VOLUME ["/root/teamsysdata", "/root/teamsysdata-backup"]

RUN zypper -n in wget \
  && wget -q -P /opt/youtrack http://download.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.jar \
  && zypper -n rm wget \
  && zypper clean

EXPOSE 8080
WORKDIR /opt/youtrack
CMD ["sh", "-c", "java -Xmx1g -XX:MaxPermSize=250m -Djava.awt.headless=true -jar youtrack-$YOUTRACK_VERSION.jar 8080"]
