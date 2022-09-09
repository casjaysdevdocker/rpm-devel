## 👋 Welcome to rpm-devel 🚀  

rpm-devel README  
  
  
## Run container

```shell
dockermgr update rpm-devel
```

### via command line

```shell
docker pull casjaysdevdocker/rpm-devel:latest && \
docker run -d \
--restart always \
--name casjaysdevdocker-rpm-devel \
--hostname casjaysdev-rpm-devel \
-e TZ=${TIMEZONE:-America/New_York} \
-v $HOME/.local/share/docker/storage/rpm-devel/rpm-devel/data:/data \
-v $HOME/.local/share/docker/storage/rpm-devel/rpm-devel/config:/config \
-p 80:80 \
casjaysdevdocker/rpm-devel:latest
```

### via docker-compose

```yaml
version: "2"
services:
  rpm-devel:
    image: casjaysdevdocker/rpm-devel
    container_name: rpm-devel
    environment:
      - TZ=America/New_York
      - HOSTNAME=casjaysdev-rpm-devel
    volumes:
      - $HOME/.local/share/docker/storage/rpm-devel/data:/data:z
      - $HOME/.local/share/docker/storage/rpm-devel/config:/config:z
    ports:
      - 80:80
    restart: always
```

## Authors  

🤖 casjay: [Github](https://github.com/casjay) [Docker](https://hub.docker.com/r/casjay) 🤖  
⛵ CasjaysDevdDocker: [Github](https://github.com/casjaysdev) [Docker](https://hub.docker.com/r/casjaysdevdocker) ⛵  
