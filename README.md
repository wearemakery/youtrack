# Youtrack Docker

This image contains Jetbrains [Youtrack](https://www.jetbrains.com/youtrack/). It's based on [Zulu](https://hub.docker.com/r/azul/zulu-openjdk-debian/).

# Usage

```
docker create --name youtrack-data \
  -v /root/teamsysdata \
  -v /root/teamsysdata-backup \
  busybox /bin/true
```

```
docker run -d \
  --volumes-from youtrack-data \
  -p 80:8080 \
  -e "BASE_URL=<url>" \
  --name youtrack wearemakery/youtrack
```
