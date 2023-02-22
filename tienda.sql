DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

/*1. Lista el nombre de todos los productos que hay en la tabla producto.*/
select nombre as Producto from producto;
/*2. Lista los nombres y los precios de todos los productos de la tabla producto.*/
select nombre "Producto",precio "Valor" from producto; 
/*3. Lista todas las columnas de la tabla producto.*/
select * from producto;
/*4. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando
el valor del precio.*/ 
select nombre "Producto",round(precio) "Valor" from producto;
/*5. Lista el código de los fabricantes que tienen productos en la tabla producto.*/ 
select fabricante.codigo from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante where producto.codigo_fabricante != 0;
/*6. Lista el código de los fabricantes que tienen productos en la tabla producto, sin mostrar
los repetidos.*/
select fabricante.codigo from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante where producto.codigo_fabricante != 0 group by fabricante.codigo;
/*7. Lista los nombres de los fabricantes ordenados de forma ascendente.*/
select nombre from fabricante order by nombre asc;
/*8. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma
ascendente y en segundo lugar por el precio de forma descendente.*/
select nombre "Producto",round(precio) "Valor" from producto order by nombre asc,precio desc;
/*9. Devuelve una lista con las 5 primeras filas de la tabla fabricante.*/
select * from fabricante limit 5;
/*10. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas
ORDER BY y LIMIT)*/
select nombre,precio from producto order by precio asc limit 1;
/*11. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER
BY y LIMIT)*/
select nombre,precio from producto order by precio desc limit 1;
/*12. Lista el nombre de los productos que tienen un precio menor o igual a $120.*/
select nombre "Productos", round(precio) "Valor" from producto where precio <= 120;
/*13. Lista todos los productos que tengan un precio entre $60 y $200. Utilizando el operador
BETWEEN.*/
select nombre "Productos", roud(precio) "Valor" from producto where precio between 60 and 200;
/*14. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador
IN.*/
select * from producto where codigo_fabricante in(1,3,5);
/*15. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil
en el nombre.*/
select nombre "Portatiles" from producto where nombre like "%Portatil%";
/*Consultas Multitabla*/
/*1. Devuelve una lista con el código del producto, nombre del producto, código del fabricante
y nombre del fabricante, de todos los productos de la base de datos.*/
select p.codigo "ID's",p.nombre "Productos",f.codigo "ID fabricante",f.nombre "fabricantes" from producto p inner join fabricante f on f.codigo = p.codigo_fabricante;
/*2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos
los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por
orden alfabético.*/
select p.codigo "ID's",p.nombre "Productos",f.codigo "ID fabricante",f.nombre "fabricantes" from producto p inner join fabricante f on f.codigo = p.codigo_fabricante order by p.nombre asc;
/*3. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto
más barato.*/
select producto.nombre "Producto",round(precio) "Precio",fabricante.nombre "Fabricante" from producto inner join fabricante on fabricante.codigo = producto.codigo_fabricante order by producto.precio asc limit 1;
/*4. Devuelve una lista de todos los productos del fabricante Lenovo.*/
select producto.codigo "ID", producto.nombre "Producto",producto.precio "Valor", fabricante.nombre "Fabricante" from producto inner join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.codigo = (select fabricante.codigo from fabricante where fabricante.nombre like "%Lenovo%");
/*5. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio
mayor que $200.*/
select producto.codigo "ID", producto.nombre "Producto",producto.precio "Valor", fabricante.nombre "Fabricante" from producto inner join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.codigo = (select fabricante.codigo from fabricante where fabricante.nombre like "%Crucial%") and producto.precio > 200;
/*6. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard.
Utilizando el operador IN.*/
select producto.codigo "ID", producto.nombre "Producto",round(producto.precio) "Valor", fabricante.nombre "Fabricante" from producto inner join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.nombre in("Asus","Hewlett-Packard");
/*7. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos
los productos que tengan un precio mayor o igual a $180. Ordene el resultado en primer
lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden
ascendente)*/
select producto.nombre "Producto", precio "Valor", fabricante.nombre from producto inner join fabricante on fabricante.codigo = producto.codigo_fabricante where precio >= 180 order by producto.precio asc,producto.nombre desc;
/*Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.*/
/*1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los
productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos
fabricantes que no tienen productos asociados.*/
select fabricante.nombre "Fabricante",producto.nombre "Producto",producto.precio "Valor" from fabricante left join producto on fabricante.codigo = producto.codigo_fabricante;
/*2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún
producto asociado.*/
select fabricante.nombre "Fabricante" from fabricante left join producto on fabricante.codigo = producto.codigo_fabricante where producto.codigo_fabricante is null;
/*Subconsultas (En la cláusula WHERE)*/
/*1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).*/
select * from producto where codigo_fabricante = (select codigo from fabricante where nombre = "Lenovo");
/*2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto
más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).*/
select * from producto where precio > (select max(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre = "Lenovo"));
/*3. Lista el nombre del producto más caro del fabricante Lenovo.*/
select * from producto where precio = (select max(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre = "Lenovo"));
/*4. Lista todos los productos del fabricante Asus que tienen un precio superior al precio
medio de todos sus productos.*/
select nombre "Producto", round(precio) "Valor" from producto where precio > (select round(avg(precio)) from producto where codigo_fabricante = (select codigo from fabricante where nombre = "Asus"));
/*Subconsultas con IN y NOT IN*/
/*1. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o
NOT IN).*/
select fabricante.nombre "Fabricante" from fabricante left join producto on fabricante.codigo = producto.codigo_fabricante where producto.codigo_fabricante is not null group by fabricante.nombre;
/*2. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando
IN o NOT IN).*/
select fabricante.nombre "Fabricante" from fabricante left join producto on fabricante.codigo = producto.codigo_fabricante where producto.codigo_fabricante is null;
/*Subconsultas (En la cláusula HAVING)*/
/*1. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número
de productos que el fabricante Lenovo.*/
SELECT F.nombre FROM producto AS P JOIN fabricante f on f.codigo = P.codigo_fabricante GROUP BY P.codigo_fabricante HAVING COUNT(*) = (select count(*) from fabricante f,producto p where f.codigo=p.codigo_fabricante and f.nombre in("Lenovo"));