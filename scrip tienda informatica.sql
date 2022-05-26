-- 1. Lista el nombre de todos los productos que hay en la tabla producto. --
select nombre as "NOMBRE" from producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto.--
select nombre , precio from producto;

-- 3. Lista todas las columnas de la tabla producto. --
select * from producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). --
select nombre, precio, (precio * 0.0079) as "en Euros", (precio * 0.0084) as "en Dolares" from producto;
-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza --
-- los siguientes alias para las columnas: nombre de producto, euros, dólares.  --

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.  --
select upper(nombre) as "nombre", precio from producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.  --
select lower(nombre) as " nombre", precio from producto;

-- Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.  --
select nombre, upper(substring(nombre,1,2)) as "dos primeros caracteres" from fabricante;

-- Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio. -- 
select nombre, round(precio) from producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal. --
select nombre, floor(precio) from producto; -- CON FLOOR SACO LOS DECIMALES Y NO REDONDEO

--  Lista el código de los fabricantes que tienen productos en la tabla producto. --
select f.codigo from producto p
		inner join fabricante f
         on p.codigo = f.codigo;
         
SELECT codigo FROM fabricante WHERE EXISTS (select codigo FROM fabricante);

-- Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos --
SELECT DISTINCT codigo FROM fabricante;

-- Lista los nombres de los fabricantes ordenados de forma ascendente --
SELECT nombre FROM fabricante order by nombre asc;

-- Lista los nombres de los fabricantes ordenados de forma ascendente -- 
SELECT nombre FROM fabricante order by nombre desc;

-- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente  --
SELECT nombre, precio FROM producto 
                       order by nombre asc, precio desc;

-- Devuelve una lista con las 5 primeras filas de la tabla fabricante
select * from fabricante limit 5;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se
-- debe incluir en la respuesta 
select * from fabricante limit 3,2;


-- Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto
					   order by precio asc
                       limit 1;
                       
-- Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto
					   order by precio desc
                       limit 1;
                       
-- 20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2
 select nombre from producto where codigo_fabricante = 2;  
 
 -- Lista el nombre de los productos que tienen un precio menor o igual a 120€
 select nombre from producto where precio <= 120; 
 
 -- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
 select nombre from producto where precio >= 400; 
 
 -- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
 select nombre from producto where not precio >= 400; 
 
 -- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
 select nombre, precio from producto where  precio > 80 and precio < 300; 
                       
-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
 select nombre, precio from producto where  precio between 80 and 300;
 
 
 -- Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6
  select nombre from producto where precio > 200 and codigo_fabricante = 6; 
  
  -- Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN
 select nombre from producto where codigo_fabricante = 1 or codigo_fabricante = 3 or codigo_fabricante = 5; 
 
 -- Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN
 select nombre from producto where codigo_fabricante in(1,5,3);
 
 -- Lista el nombre y el preciode los productos en céntimos (Habráque multiplicarpor 100 el valor del precio).
-- Cree un alias para la columna que contiene el precio que se llame céntimos
select nombre, precio, (precio*100) as "centesimo" from producto;

-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S
select nombre from fabricante where nombre like'S%';

-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e
select nombre from fabricante where nombre like'%e';

-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w
select nombre from fabricante where nombre like'%w%';

--  Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres
select nombre from fabricante where length(nombre) = 4;

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre
select nombre from producto where nombre like'%Portátil%';

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre
-- y tienen un precio inferior a 215 €
select nombre, precio from producto where nombre like'%Monitor%' and precio < 215;

-- Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene
-- el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en
-- orden ascendente)
select nombre, precio  from producto where precio >= 180 
									 order by precio desc ,nombre asc;
                                     
                                     
                                     
 --        Consultas multitabla (Composición interna)                                    
-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de
-- la base de datos.
select producto.nombre, precio, fabricante.nombre as "fabricante" from producto  inner join fabricante 
														on producto.codigo_fabricante = fabricante .codigo;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de
-- la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
select producto.nombre, precio, fabricante.nombre as "fabricante" from producto
												   inner join fabricante
                                                   on producto.codigo_fabricante = fabricante.codigo
                                                   order by fabricante.nombre  asc;

-- 3. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del
-- fabricante, de todos los productos de la base de datos
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre from producto
																			  inner join fabricante
                                                                              on producto.codigo_fabricante = fabricante.codigo;
                                                                              
                                                                              
-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato  
select  producto.nombre, producto.precio, fabricante.nombre from producto
															 inner join fabricante
                                                             on producto.codigo_fabricante = fabricante.codigo
                                                             order by precio asc
                                                             limit 1;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro
select  producto.nombre, producto.precio, fabricante.nombre from producto
															 inner join fabricante
                                                             on producto.codigo_fabricante = fabricante.codigo
                                                             order by precio desc
                                                             limit 1;

-- Devuelve una lista de todos los productos del fabricante Lenovo.
select * from producto 
         inner join fabricante
         on producto.codigo_fabricante = fabricante.codigo
         where fabricante.nombre = 'Lenovo';

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€
select * from producto
			  inner join fabricante
              on producto.codigo_fabricante = fabricante.codigo
              where fabricante.nombre = 'Crucial' and producto.precio > 200;
              
-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin
-- utilizar el operador IN.          
select producto.nombre , fabricante.nombre from producto
										   inner join fabricante
                                           on producto.codigo_fabricante = fabricante.codigo
                                           where fabricante.nombre = 'Asus' or
                                                  fabricante.nombre = 'Hewlett-Packard' or
												 fabricante.nombre = 'Seagate';

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN
select * from producto
		 inner join fabricante
         on producto.codigo_fabricante = fabricante.codigo
         where fabricante.nombre
         in('Asus','Hewlett-Packard', 'Seagate');
 
 -- 0. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre
-- termine por la vocal e
select producto.nombre , producto.precio from producto
                                         inner join fabricante
                                         on producto.codigo_fabricante = fabricante.codigo
                                         where fabricante.nombre like'%e';


-- Devuelve un listado con el nombre y el precio detodos los productos cuyo nombre de fabricante contenga
-- el carácter w en su nombre
select producto.nombre , producto.precio from producto
                                         inner join fabricante
                                         on producto.codigo_fabricante = fabricante.codigo
                                         where fabricante.nombre like'%w%';

-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos
-- que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden
-- descendente) y en segundo lugar por el nombre (en orden ascendente)
select producto.nombre, precio , fabricante.nombre from producto
                                                   inner join fabricante
                                                   on producto.codigo_fabricante = fabricante.codigo
                                                   where producto.precio >= 180                                                  
                                                   order by precio desc,  producto.nombre asc;

-- Devuelveun listado con el código y elnombrede fabricante, solamentede aquellos fabricantesquetienen
-- productos asociados en la base de datos
select fabricante.codigo, fabricante.nombre from fabricante
                                                   inner join producto
                                                   on producto.codigo_fabricante = fabricante.codigo
                                                   group by fabricante.nombre;

-- lef y rig join
-- 1. Devuelve un listado de todos losfabricantes que existen en la base de datos, junto con los productos que
-- tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos
-- asociados
select * from fabricante 
              left join producto
              on fabricante.codigo = producto.codigo_fabricante
              group by fabricante.nombre;

-- Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado 
select fabricante.nombre from fabricante 
              left join producto
              on fabricante.codigo = producto.codigo_fabricante
              where not fabricante.codigo = any(select producto.codigo_fabricante from producto);   
              
-- 3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta
-- no pueden existir porque la relcion dice que un fabricante tiene muchos productos entoces no hay producto que quede no tenga fabricante

-- 16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe
-- incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el
-- nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos
select fabricante.nombre, count(producto.codigo)
from fabricante
left join producto
on fabricante.codigo = producto.codigo_fabricante
group by fabricante.codigo
order by count(producto.codigo) desc;

