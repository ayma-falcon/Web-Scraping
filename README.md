# Proyecto Integrador - WebScraping
Proyecto Integrador para SQL sugerido por Instructor en el bootcamp de Henry

## El Web Scraping: Descubriendo Datos en la Web

En el mundo actual, la información fluye a través de la internet, y cada vez más aspectos de nuestra vida se ven influenciados por la tecnología y la disponibilidad de datos en línea. En este contexto, el proyecto que vamos a explorar se sumerge en el fascinante mundo del web scraping, una técnica que nos permite recolectar datos valiosos de páginas web de manera automatizada. Pero, ¿qué es exactamente el web scraping?

Imagina que las páginas web son vastos almacenes de información, y el web scraping es la herramienta que nos permite entrar y recopilar los datos que nos interesan. Como si fuéramos mineros modernos, usamos el web scraping para extraer información valiosa y transformarla en un formato que podamos analizar y comprender.

## Introducción y Descripción del Proyecto

Nuestro objetivo es realizar un web scraping en el sitio web de Cúspide Libros (www.cuspide.com) para obtener una lista de los 100 libros más vendidos de la semana. Los datos que deseamos obtener de cada libro son su título, la URL para acceder a él, su precio en pesos argentinos, su precio en dólares estadounidenses y su precio en dólares considerando la cotización del dólar blue en Argentina, junto con la fecha en que se obtuvieron estos datos. Para obtener la cotización del dólar blue en Argentina, también utilizaremos la técnica de web scraping en una página web de elección que proporcione esta información.

Además, queremos organizar estos datos de manera efectiva. Para hacerlo, crearemos una tabla en una base de datos MySQL para almacenar todos estos detalles. También estableceremos otra tabla especial para rastrear cualquier error que pueda ocurrir durante el proceso de web scraping, como la imposibilidad de obtener datos de algún título en particular.

<div align="center">
  <h2>Proceso de ETL (Extraccion, Transformación y Carga)</h2>
</div>

![ELT](https://github.com/ayma-falcon/Web-Scraping/assets/113071324/4b6bd589-ebae-4881-bd4b-1947a39265cc)

#### En este proyecto, la tarea principal fue la de recolección y transformación de datos. En el archivo [Web Scraping](https://github.com/ayma-falcon/Web-Scraping/blob/main/Codigos%20y%20archivos/webscraping.ipynb) esta todo el procedimiento detallado

* ### Recopilación de datos

#### Título y URL de los Libros: 
Los `títulos` de los libros y sus `URLs` se obtienen directamente de la página principal de Cúspide Libros (www.cuspide.com). Navegamos por la lista de los 100 libros más vendidos de la semana y extraemos tanto el título del libro como la dirección web que conduce a su página individual, a su vez colocamos el `Id` correspodniente a la posición en el Top de cada libro.

#### Precios en AR$ y U$S de los Libros: 
Para obtener los precios de los libros en pesos argentinos (`AR$`) y dólares estadounidenses (`U$S`), realizamos un proceso similar para cada libro individual. Utilizamos la URL de cada libro y accedemos a su página específica en el sitio web. A través del web scraping, localizamos y extraemos los datos de precios en pesos y dólares.

#### Valor en U$S Blue (Dólar Paralelo) de Argentina: 
Aquí seguimos un proceso un poco más elaborado. En primer lugar, visitamos una página web externa que proporciona la cotización del dólar blue en Argentina. Utilizando el web scraping, extraemos esta información financiera actualizada. Luego, combinamos esta tasa con los precios en pesos de los libros para calcular sus valores en dólares blue (`U$s Blue`). Además agregamos el campo de `Fecha`, para saber cual fue la última actualización de precios

* ### Manejo de errores

En todo proyecto de recopilación de datos en línea, es común encontrarse con situaciones en las que no se pueden extraer ciertos datos y al igual que los libros con precio le agregamos el campo `Fecha`. En nuestro proyecto de web scraping sobre los libros más vendidos en Cúspide Libros, hemos abordado esta cuestión para garantizar la integridad de nuestros resultados.

#### División en Dos Listas (Libros con Precios y Errores):

Antes de calcular los valores en dólares blue, clasificamos los libros en dos categorías: aquellos con precios y aquellos marcados como `"datos no encontrados"` debido a problemas en la extracción. Los libros con "datos no encontrados" se consideran `errores`, y los hemos separado del conjunto principal. 

#### Reconfiguración de Identificadores (ID):

Cabe destacar que, al separar los libros con errores, los identificadores numéricos (ID) pueden experimentar cambios. En la tabla original de libros con precios, los ID se ajustan para eliminar saltos en la numeración, incluso si hay libros con errores intercalados. Por otro lado, en la tabla de libros con errores, los ID se asignan de manera incremental, comenzando desde 0 y aumentando a medida que se agregan libros sin precios.

* ### Carga de Datos a la Base de Datos

#### Transformación en Archivos CSV:

Para poder cargar los datos a MySQL Workbench, convertimos las listas de libros con precios y de libros con errores en archivos CSV. Estos archivos CSV son formatos tabulares que permiten organizar y representar los datos de manera estructurada, lo que facilita su posterior manipulación y carga en la base de datos.

#### Creación de la Base de Datos y Tablas:

En el archivo [webscraping.sql](https://github.com/ayma-falcon/Web-Scraping/blob/main/Codigos%20y%20archivos/webscraping.sql) proporcionamos los comandos necesarios para crear la base de datos y las tablas en MySQL Workbench. Esto incluye la definición de la estructura de las tablas, como los nombres de las columnas y sus tipos de datos correspondientes.

#### Carga de Datos a las Tablas:

Una vez que hemos definido las tablas, utilizamos los archivos CSV para cargar los datos en las tablas correspondientes en MySQL Workbench. A través de los comandos SQL, ejecutamos el proceso de carga, asegurándonos de que los datos sean insertados en las columnas adecuadas.

## Resultado Final

Después de completar el proceso de `web scraping`, `manejo de errores` y `carga de datos` en `MySQL Workbench`, obtuvimos un resultado final en forma de dos tablas organizadas: una tabla que almacena los datos de los libros con precios y otra tabla que registra los errores asociados con los libros sin precios. A continuación, presentamos cómo se ven estas tablas:
#### Tabla Libros
![Tabla Libros](https://github.com/ayma-falcon/Web-Scraping/assets/113071324/3d034508-e8d5-4d99-bb80-4d8534aa1b04)
#### Tabla Errores
![Tabla Errores](https://github.com/ayma-falcon/Web-Scraping/assets/113071324/2ca92877-dbbe-49d6-b529-7eec85ed73d2)

## Explorando el Potencial de los Datos Recolectados

Con estas tablas en su lugar, hemos creado una plataforma sólida para llevar a cabo análisis significativos sobre los libros más vendidos y los errores asociados. A continuación, presentamos algunas de las acciones que podemos llevar a cabo con los datos obtenidos:

* **Identificar Precios Extremos:** Mediante consultas a la tabla de precios de libros, podemos determinar los libros con los precios más altos y más bajos, brindándonos información sobre las preferencias de los lectores y las tendencias de mercado.

* **Explorar Tipos de Libros Populares:** Al analizar los títulos y sus géneros en la tabla de precios, podemos descubrir qué tipos de libros son los más vendidos. Esto puede brindarnos información valiosa sobre los intereses de los lectores.

* **Comparar Precios Oficiales con el Dólar Blue:** Al calcular la diferencia entre los precios en dólares oficiales y los precios en dólares blue, podemos comprender cómo las tasas de cambio impactan los precios de los libros y cómo esto afecta el mercado.

En resumen, el resultado final de este proyecto de web scraping es una base de datos organizada y rica en información. Esto nos proporciona un trampolín para explorar las tendencias del mercado de libros, analizar los precios y entender cómo los factores económicos influyen en el mundo de los libros más vendidos.
