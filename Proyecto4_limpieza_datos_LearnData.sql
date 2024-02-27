#PROYECTO SQL: LIMPIEZA DE DATOS LEARNDATA

#Creamos nuestro espacio de trabajo, donde incorporaremos nuestros datos en crudo tratados de leardata_crudo
CREATE DATABASE IF NOT EXISTS learndata;

#Creamos la tabla de dimensiones dim_producto
CREATE TABLE learndata.dim_producto (
pk_idproducto int,
tipo_producto varchar(50),
nombre_producto varchar(100),
ind_publicado int,
ind_visibilidad_catalogo int,
ind_inventario int,
estado_inventario varchar(50),
ind_vendido_ind int,
imp_venta decimal(10,2),
categoria varchar(50),
PRIMARY KEY (pk_idproducto)
);

#Insertamos los datos en la tabla
INSERT INTO learndata.dim_producto 
select 
id ,
tipo,
nombre ,
publicado ,
case 
	when visibilidad_catalogo ='visible' then 1
    when visibilidad_catalogo !='visible' then 0
end ind_visibilidad_catalogo,
en_inventario ,
inventario,
vendido_individualmente,
precio_normal,
categorias
from learndata_crudo.raw_productos_wocommerce;

#Creamos la tabla dim_clientes
CREATE TABLE learndata.dim_clientes (
pk_cliente int primary key,
nombre varchar(15),
apellido varchar(30),
email varchar(50),
telefono varchar(20),
pais varchar(40),
region varchar(40),
fecha_alta date
);

#Insertamos los datos en la tabla de clientes
#Usamos las funciones json_value para extraer el valor de los campos y str_to_date para castear el string de origen a fecha.
Insert into learndata.dim_clientes
SELECT 
id,
json_value(billing,"$.first_name") as nombre,
last_name as apellido,
json_value(billing,"$.email") as email,
json_value(billing,"$.phone") as telef,
json_value(billing,"$.country") as pais,
json_value(billing,"$.Region") as region,
str_to_date(date_created,"%d/%m/%Y %H:%i:%s") as fecha_alta
FROM LEARNDATA_CRUDO.raw_clientes_wocommerce;

#Creamos la tabla de pedidos
CREATE TABLE learndata.fac_pedidos(
pk_pedido int PRIMARY KEY,
sku_producto varchar(100),
estado varchar(50),
fecha_pedido datetime,
tipo_pago varchar(50),
imp_subtotal decimal(10,2),
imp_descuento decimal(12,2),
cod_cupon varchar(50),
imp_total decimal(10,2),
id_producto int,
qty_pedido int,
id_cliente int
);

#Insertamos registros
Insert into learndata.fac_pedidos
select 
numero_de_pedido,
sku,
estado_de_pedido,
str_to_date(fecha_de_pedido,'%Y-%m-%d %H:%i') as fecha_pedido,
 case
	when upper(titulo_metodo_de_pago) like '%STRIPE%' then 'Stripe'
    else 'Pago con tarjeta'
end as tipo_pago,
importe_subtotal_carrito,
importe_de_descuento_del_carrito,
cupon_articulo,
importe_total_pedido,
prod.pk_idproducto,
cantidad,
`id cliente`
from learndata_crudo.raw_pedidos_wocommerce ped
 left join learndata.dim_producto prod
 on replace(nombre_del_articulo,'dashborads','dashboards') = prod.nombre_producto;
 
 

