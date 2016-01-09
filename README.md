# Youtrack Docker

This image contains Jetbrains [Youtrack](https://www.jetbrains.com/youtrack/). It's optimized for size and based on a minimal Zulu OpenJDK container [wearemakery/zulu-jdk-opensuse](https://hub.docker.com/r/wearemakery/zulu-jdk-opensuse/).

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
  --name youtrack wearemakery/youtrack
```
