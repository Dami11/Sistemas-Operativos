#  repo de docker     

 sudo yum install -y yum-utils
 sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

#  última versión de docker y containerd

 sudo yum install docker-ce docker-ce-cli containerd.io

#  Inicia Docker    

 sudo systemctl start docker

#  Verifica que Docker fue instalado correctamente

 sudo docker run hello-world

# Ruta del docker compose

cd C:\xampp\htdocs\Docker

# Ejecución del docker compose

docker compose up -d





