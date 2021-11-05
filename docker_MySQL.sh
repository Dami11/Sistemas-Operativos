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

#  instalación de Github

yum install git

# clonación del repositorio del docker-compose

git clone https://github.com/Dami11/Docker.git

# Ruta del docker compose

cd Docker

# Ejecución del docker compose

docker compose up -d







# Instalacion de MySQL

yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm

yum install mysql-community-server

grep 'A temporary password' /var/log/mysqld.log |tail -1

# Inicio de MySQL

service mysqld start

/usr/bin/mysql_secure_installation

# Inicio de sesión

mysql -h localhost -u root -p 

# Creación de la base de datos

CREATE DATABASE damian_mesa;
 
# Creación de un nuevo usuario

CREATE USER 'db_user'@'localhost' IDENTIFIED BY 'password';
 
# Asignación de permisos a ese usuario


GRANT ALL ON damian_mesa.* TO 'db_user'@'localhost';


FLUSH PRIVILEGES;


# Seleccion de la Base de datos 

use damian_mesa

# Creación de las tablas y vistas de la base de datos


-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2021 a las 20:47:53
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aulasdata`
--
CREATE DATABASE IF NOT EXISTS `damian_mesa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `damian_mesa`;

-- --------------------------------------------------------

create table `agenda` (

`idUser` int not null PRIMARY KEY,
`tema` varchar(255) not null,
`fecha` date not null,
`horario` varchar(10) not null


);
--
-- Estructura de tabla para la tabla `alumno_grupo`
--

CREATE TABLE `alumno_grupo` (
  `id` int NOT NULL,
  `IdUser` int NOT NULL,
  `IdGrupo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumno_grupo`
--




-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

CREATE TABLE `chat` (
  `idChat` int NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `chatType` varchar(32) NOT NULL,
  `estado` varchar(16) NOT NULL,
  `resumen` varchar(255) DEFAULT NULL,
  `fechaCierre` date DEFAULT NULL,
  `fechaCreacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `chat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente_grupo_materia`
--

CREATE TABLE `docente_grupo_materia` (
  `id` int NOT NULL,
  `IdUser` int NOT NULL,
  `IdGrupoMateria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idUser` int not null PRIMARY KEY,
  `idGrupo` int auto_increment UNIQUE KEY NULL,
  `nombre` varchar(32) NOT NULL,
  `orientaciones` varchar(32) NOT NULL,
  `materia` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Estructura de tabla para la tabla `grupo_materia`
--

CREATE TABLE `grupo_materia` (
  `id` int NOT NULL,
  `idGrupo` int NOT NULL,
  `idMateria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `idMateria`int NOT NULL,
  `nombre` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `idMensaje` int NOT NULL,
  `idChat` int NOT NULL,
  `contenido` varchar(255) NOT NULL,
  `estado` varchar(64) DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `fechaEnvio` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `idUser` int NOT NULL,
  `ci` varchar(32) NOT NULL,
  `userPass` varchar(32) NOT NULL,
  `nombre` varchar(16) NOT NULL,
  `apellido` varchar(16) NOT NULL,
  `userType` varchar(16) NOT NULL,
  `status` varchar(8) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Estructura de tabla para la tabla `users_chat_mensaje`
--

CREATE TABLE `users_chat_mensaje` (
  `id` int NOT NULL,
  `IdUser` int NOT NULL,
  `idChat` int NOT NULL,
  `idMensaje` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `user_chat` (
  `id` int NOT NULL,
  `IdUser` int NOT NULL,
  `IdChat` int NOT NULL,
  `userType` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno_grupo`
--
ALTER TABLE `alumno_grupo`
  ADD PRIMARY KEY (`id`,`IdUser`,`IdGrupo`),
  ADD UNIQUE KEY `IdUser` (`IdUser`),
  ADD UNIQUE KEY `IdUser_4` (`IdUser`),
  ADD KEY `IdUser_2` (`IdUser`),
  ADD KEY `IdUser_3` (`IdUser`),
  ADD KEY `IdGrupo` (`IdGrupo`);

--
-- Indices de la tabla `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`idChat`);

--
-- Indices de la tabla `docente_grupo_materia`
--
ALTER TABLE `docente_grupo_materia`
  ADD PRIMARY KEY (`id`,`IdUser`,`IdGrupoMateria`),
  ADD KEY `id` (`id`,`IdUser`,`IdGrupoMateria`),
  ADD KEY `IdGrupoMateria` (`IdGrupoMateria`),
  ADD KEY `IdUser` (`IdUser`);

--
-- Indices de la tabla `grupo`
--

--
-- Indices de la tabla `grupo_materia`
--
ALTER TABLE `grupo_materia`
  ADD PRIMARY KEY (`id`,`idGrupo`,`idMateria`),
  ADD KEY `idGrupo` (`idGrupo`,`idMateria`),
  ADD KEY `idMateria` (`idMateria`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idMateria`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`idMensaje`,`idChat`),
  ADD KEY `idChat` (`idChat`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- Indices de la tabla `users_chat_mensaje`
--
ALTER TABLE `users_chat_mensaje`
  ADD PRIMARY KEY (`id`,`IdUser`,`idChat`,`idMensaje`),
  ADD KEY `IdUser` (`IdUser`,`idChat`,`idMensaje`),
  ADD KEY `idMensaje` (`idMensaje`),
  ADD KEY `idChat` (`idChat`);

--
-- Indices de la tabla `user_chat`
--
ALTER TABLE `user_chat`
  ADD PRIMARY KEY (`id`,`IdUser`,`IdChat`),
  ADD KEY `IdUser` (`IdUser`,`IdChat`),
  ADD KEY `IdChat` (`IdChat`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno_grupo`
--
ALTER TABLE `alumno_grupo`
  ADD CONSTRAINT `alumno_grupo_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `users` (`idUser`) ON UPDATE CASCADE,
  ADD CONSTRAINT `alumno_grupo_ibfk_2` FOREIGN KEY (`IdGrupo`) REFERENCES `grupo` (`idGrupo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `docente_grupo_materia`
--
ALTER TABLE `docente_grupo_materia`
  ADD CONSTRAINT `docente_grupo_materia_ibfk_1` FOREIGN KEY (`IdGrupoMateria`) REFERENCES `grupo_materia` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `docente_grupo_materia_ibfk_2` FOREIGN KEY (`IdUser`) REFERENCES `users` (`idUser`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo_materia`
--
ALTER TABLE `grupo_materia`
  ADD CONSTRAINT `grupo_materia_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `grupo_materia_ibfk_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `mensaje_ibfk_1` FOREIGN KEY (`idChat`) REFERENCES `chat` (`idChat`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `users_chat_mensaje`
--
ALTER TABLE `users_chat_mensaje`
  ADD CONSTRAINT `users_chat_mensaje_ibfk_1` FOREIGN KEY (`idMensaje`) REFERENCES `mensaje` (`idMensaje`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_mensaje_ibfk_2` FOREIGN KEY (`idChat`) REFERENCES `chat` (`idChat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_mensaje_ibfk_3` FOREIGN KEY (`IdUser`) REFERENCES `users` (`idUser`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_chat`
--
ALTER TABLE `user_chat`
  ADD CONSTRAINT `user_chat_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `users` (`idUser`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_chat_ibfk_2` FOREIGN KEY (`IdChat`) REFERENCES `chat` (`idChat`) ON UPDATE CASCADE;
COMMIT;

ALTER TABLE `agenda`
 ADD CONSTRAINT `idUser_fk` FOREIGN KEY (`IdUser`) REFERENCES `users` (`idUser`);
 
ALTER TABLE `grupo`
 ADD CONSTRAINT `idUser_fk2` FOREIGN KEY (`IdUser`) REFERENCES `users` (`idUser`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


