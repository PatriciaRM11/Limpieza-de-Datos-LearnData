Proyecto Limpieza de datos - LearnData

📋Descripción del Proyecto

El proyecto de limpieza de datos con SQL tiene como objetivo principal mejorar la calidad y confiabilidad de los conjuntos de datos utilizados en las organizaciones.
Los datos desempeñan un papel fundamental en la toma de decisiones y la generación de informes, por lo que es esencial garantizar que estén libres de errores, inconsistencias y duplicados.
Por lo cual vamos a realizar algunas tareas de limpieza de datos para nuestro cliente LearnData.

🎯El objetivo de este proyecto

•	Creación de una base de datos
•	Identificar y Corregir Inconsistencias
•	Detección y Eliminación de Duplicados
•	Normalización de Datos

📝Contexto
LearnData es una empresa de e-learning dedicada a la venta de cursos online de análisis de datos. Su principal objetivo es:
•	Comenzar a construir una infraestructura tecnológica para analizar sus datos.
•	Limpiar los datos para que los puedan consumir las áreas de negocio.
Utiliza las siguientes herramientas para gestionar su negocio:
•	Stripe: Es una plataforma de procesamiento de pagos por internet, al igual que paypal.
•	Wocommerce: Es un plugin de wordpress que te permite convertir tu web a un sitio de ecommerce y vender productos.
•	Wordpress: Es un sistema de gestión de contenidos(CMS), un software utilizado para construir, modificar y mantener sitios web.

🆘 El problema
LearnData ha ido creciendo en la venta de sus cursos online y no tiene información de cuáles son sus indicadores de ventas, por lo cual requiere comenzar a analizar sus principales métricas financieras,
para determinar que productos tienen mayor venta, que tipo de clientes compran sus productos o cuales son los pagos que reciben por producto.

En este momento LearnData no tiene ningún sistema creado para poder capturar,analizar y tomar mejores decisiones y necesita tener una base de datos donde puedan ver y analizar esta información
y a futuro crear un dashboard con los KPI para ver el rendimiento de su negocio de cursos online.

🕵️ Habilidades Adquiridas
✅  Creación de base de datos en MYSQL
✅  Creación de tablas en MYSQL
✅  Creación de Primary Keys
✅  Insertar datos en una tabla en MYSQL
✅  Seleccionar datos de una tabla en MYSQL
✅  Transformación de datos en MYSQL
✅  Funciones varias: CAST, REPLACE, DATE, RIGHT, CASE
✅  Parseo de JSON con MYSQL

🛠️Herramientas a utilizar
En este proyecto utilizaremos lenguaje de SQL y el gestor de base de datos MYSQL.

📶Conjunto de datos del proyecto
A continuación, mostramos la descripción de los dataset del proyecto, esto es conocido como un diccionario de datos.

👩💻Tabla raw_cliente_wocommerce:
Contiene información sobre los clientes

📦Tabla raw_pedidos_wocommerce
Contiene información de los pedidos

📚Tabla raw_productos_wocommerce
Contiene información sobre los productos

💰Tabla raw_pagos_stripe
Contiene información sobre los pagos

💡Desarrollo | Ejecución
Análisis previo del problema

1.	¿Qué fuentes de datos tiene la empresa?
  	La empresa utiliza wordpress con un plugin de wocommerce como plataforma de venta de sus cursos online y luego cuenta con stripe como pasarela de pagos a de más de los pagos de tarjeta de crédito.
2.	¿En qué formato se descargan los datos?
  	Los datos crudos los tendremos en csv directamente descargados de las fuentes.
3.	¿Qué datos tenemos?
   	Tenemos datos de los cursos que se venden, los clientes, de los pedidos y de los pagos recibidos por stripe.
4.	Modelo de datos
  	Tenemos la tabla de pedidos que se relaciona con la de clientes y productos mediante SKU_producto e id_cliente y por otro lado tenemos la tabla la de pagos de stripe que la relacionaremos con
  	la de pedidos por el número de pedido.
5.	Análisis exploratorio de las tablas.

✍️Ejecución
Parte I - Creación de una nueva base de datos para almacenar las tablas + tablas
1.	Crear una nueva base de datos en MYSQL llamada “learndata” + tablas
2.	Crear la tabla de productos llamada dim_producto a partir de los datos en crudo.
   - Chequear como vienen los datos
   - Cambiar los nombres de los campos
	 - Insertar los campos a la nueva tabla
3.	Crear la tabla de clientes llamada dim_clientes a partir de los datos en crudo
	- Chequear como vienen los datos
	- Cambiar los nombres de los campos
	- Convertir el campo date_created que viene como timestamp a solo fecha
	- Extraer del campo billing, todos los descriptivos del cliente que necesitamos aprendiendo a parsear un JSON.
	- Insertar los campos a la nueva tabla
4.	Crear la tabla de pedidos llamada fac_pedidos a partir de los datos en crudo
	 - Chequear como vienen los datos
   - 	Cambiar los nombres de los campos
	- Sustituir el nombre del producto por el id.
	- Normalizar la columna método de pago.
	- Convertir a date la columna fecha_pedido
	- Redondear decimales de la columna coste_articulo a enteros
	- Insertamos los pedidos a la tabla

Parte || - Limpieza de datos en tablas
1.	Verificar que no existan campos nulos, de existir reemplazar por un valor comodín (según el tipo de dato).
2.	Realizar una consulta que devuelva las fechas en diferentes formatos.
3.	Verificar que los tipos de datos de los campos PK son de tipo entero (int) en las tablas.
4.	Validar que se puedan realizar joins entre las tablas y analizar los resultados.








