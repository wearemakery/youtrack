# Youtrack Docker

This image contains a minimal Jetbrains [Youtrack](https://www.jetbrains.com/youtrack/) setup. It's based on the [Zulu JDK and Alpine linux](https://github.com/zulu-openjdk/zulu-openjdk/tree/master/alpine).

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
