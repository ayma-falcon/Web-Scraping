CREATE DATABASE webscraping;

USE webscraping;

DROP TABLE IF EXISTS LibrosTop100;
CREATE TABLE LibrosTop100(
IdLibro INT NOT NULL,
Titulo VARCHAR(100),
URL VARCHAR(100),
Precio FLOAT,
Precio_USD FLOAT,
Precio_USD_Blue FLOAT,
Fecha DATE,
PRIMARY KEY (IdLibro)
);

-- Si el estado de esta variable es off hay que activarla para que no retorne errores
SHOW VARIABLES LIKE 'local_infile'; -- vemos su estado (OFF/ON)
SET GLOBAL local_infile = 1; -- para activar la variable

/*Si hay errores de permisos hay que ejecutar estos comandos para que nos otorgue esos permisos
y nos de los privilegios para poder acceder a los archivos en el sistema de archivos del servidor MySQL*/
GRANT FILE ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

/*Los archivos que se quieran cargar tienen que estar en la carpeta uploads
Al estar ahi mysql los toma como que puede leerlos y escribir en ellos, de lo contrario
los toma como archivos privados a los que no puede acceder*/
TRUNCATE TABLE LibrosTop100;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\webscrapinglibros.csv'
INTO TABLE LibrosTop100
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM LibrosTop100;

DROP TABLE IF EXISTS Errores;
CREATE TABLE Errores(
IdError INT NOT NULL,
Titulo VARCHAR(100),
URL VARCHAR(100),
Fecha DATE,
PRIMARY KEY (IdError)
);

TRUNCATE TABLE Errores;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\erroreslibros.csv'
INTO TABLE Errores
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM Errores;