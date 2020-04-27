------- 1.1.3 Consultas sobre una tabla -------


-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre
FROM PRODUCTO;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio
FROM PRODUCTO;

-- 3. Lista todas las columnas de la tabla producto.
SELECT *
FROM PRODUCTO;

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio, ROUND(precio*1.08,2)
FROM PRODUCTO;

-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre as 'nombre de producto', precio as 'euros', ROUND(precio*1.08,2) as 'dólares'
FROM PRODUCTO;

-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio
FROM PRODUCTO;

-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio
FROM PRODUCTO;

-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, LEFT(nombre,2)
FROM fabricante;

-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio)
FROM producto;

-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, FLOOR(precio)
FROM producto;

-- 11. Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT codigo_fabricante
FROM producto;

-- 12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT(codigo_fabricante)
FROM producto;

-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre
FROM fabricante
ORDER BY nombre ASC;

-- 14. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre
FROM fabricante
ORDER BY nombre DESC;

-- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre
FROM producto
ORDER BY nombre ASC, precio DESC;

-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT *
FROM fabricante
LIMIT 5;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT *
FROM fabricante
LIMIT 2 OFFSET 3;

-- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio
FROM producto
ORDER BY precio ASC
LIMIT 1;

-- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1;

-- 20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre
FROM producto
WHERE codigo_fabricante = 2;

-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre
FROM producto
WHERE precio <= 120;

-- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre
FROM producto
WHERE precio >= 400;

-- 23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre
FROM producto
WHERE ! (precio >= 400);

-- 24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT *
FROM producto
WHERE precio >= 80 AND precio <= 300;

-- 25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT *
FROM producto
WHERE precio BETWEEN 60 AND 200;

-- 26. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT *
FROM producto
WHERE precio >= 200
	AND codigo_fabricante = 6;

  -- 27. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT *
FROM producto
WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

-- 28. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT *
FROM producto
WHERE codigo_fabricante IN (1,3,5);

-- 29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio*100 AS 'céntimos'
FROM producto;

-- 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre
FROM fabricante
WHERE nombre LIKE 's%';

-- 31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre
FROM fabricante
WHERE nombre LIKE '%e';

-- 32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre
FROM fabricante
WHERE nombre LIKE '%w%'

-- 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre
FROM fabricante
WHERE nombre LIKE '____';

-- 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre
FROM producto
WHERE nombre LIKE '%Portátil%';

-- 35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre
FROM producto
WHERE nombre LIKE '%Monitor%'
AND precio < 215;

-- 36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio
FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;
