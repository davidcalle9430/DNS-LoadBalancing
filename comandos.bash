# para el servidor de DNS
docker pull sameersbn/bind:latest
# obtiene la imagen
docker build -t sameersbn/bind github.com/sameersbn/docker-bind
# buildea la imagen
docker run --name bind -d --restart=always \
  --publish 53:53/udp --publish 10000:10000 \
  --volume /srv/docker/bind:/data \
  sameersbn/bind:latest
# corre la imagen y expone los puertos 10000 y 53, el 53 es el de DNS y el 10000 es para el el administrador de BIND


# para la aplicaciòn web ya hay un docker compse que corre redis
docker-compose build
docker-compose up -d
#hago un docker inspect paara ver cuàl es la ip del servidor redis
