
`docker --version` Permite ver la versión de docker

`docker images` Permite ver las imágenes

`dokcer run` Permite crear un contenedor
ejemplo de creación de contenedor básico:

---
---docker

docker run --name mysqlv1 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:latest

---

`docker ps` Permite visualizar los contenedores que están en ejecución

`docker ps -a` Permite visualizar todos los contenedores en ejecución o no

`docker stop id o nombre del contenedor` Detiene el contenedor

`docker start id o nombre del contenedor` Inicia el contenedor

`docker rm id o el nombre del contenedor` Elimina un contenedor pero se debe detener primero el contenedor

`docker rm -f id o el nombre del contenedor` Forza la eliminación del contenedor sin reiniciarlo