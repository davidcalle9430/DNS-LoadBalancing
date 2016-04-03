#instalar docker en linux
curl -sSL https://get.docker.com/ | sh

#instalar docker-compose
curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# para el servidor de DNS
docker pull sameersbn/bind:latest
# obtiene la imagen
docker build -t sameersbn/bind github.com/sameersbn/docker-bind
# buildea la imagen, incluye la creación de un volumen para que la información persista dentro del host
docker run --name bind -d --restart=always \
  --publish 53:53/udp --publish 10000:10000 \
  --volume /srv/docker/bind:/data \
  sameersbn/bind:latest
# corre la imagen y expone los puertos 10000 y 53, el 53 es el de DNS y el 10000 es para el el administrador de BIND


# para la aplicaciòn web ya hay un docker compse que corre redis
docker-compose build
docker-compose up -d
# docker inspect paara verla ifnromacion principal de cada contenedor
docker inspect <nombre>


#parar un proceso que corre en un puerto
sudo kill `sudo lsof -t -i:9001`



#para windows o mac, para saber la ip del docker-machine
docker-machine ip default

# agregar una redirección proxy a los puertos, para el docker machine cambiar los puertos y las ips para que corresponda
netsh interface portproxy add v4tov4 listenaddress=127.0.0.1 listenport=80 connectaddress=192.168.99.100 connectport=80
