------- 1.1.6 Consultas resumen -------

-- 01. Calcula el número total de productos que hay en la tabla productos.
SELECT count(*)
FROM producto;

-- 02. Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT count(*)
FROM fabricante;

-- 03. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
SELECT count(DISTINCT(codigo_fabricante))
FROM producto;

-- 04. Calcula la media del precio de todos los productos.
SELECT AVG(precio)
FROM producto;

-- 05. Calcula el precio más barato de todos los productos.
SELECT MIN(precio)
FROM producto;

-- 06. Calcula el precio más caro de todos los productos.
SELECT MAX(precio)
FROM producto;

-- 07. Lista el nombre y el precio del producto más barato.
SELECT nombre, precio
FROM producto
WHERE  precio = (
    SELECT MIN(precio)
    FROM producto
  );

-- 08. Lista el nombre y el precio del producto más caro.
SELECT nombre, precio
FROM producto
WHERE  precio = (
    SELECT MAX(precio)
    FROM producto
  );

  -- 09. Calcula la suma de los precios de todos los productos.
SELECT SUM(precio)
FROM producto;

-- 10. Calcula el número de productos que tiene el fabricante Asus.
SELECT count(*)
FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus';

-- 11. Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(precio)
FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus';

-- 12. Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(precio)
FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus';

-- 13. Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(precio)
FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus';

-- 14. Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(precio)
FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus';

-- 15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(precio), MIN(precio), AVG(precio), COUNT(precio)
FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Crucial';

-- 16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT f.nombre, count(p.nombre) as Num_productos
FROM fabricante as f
LEFT JOIN producto as p
ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
ORDER BY Num_productos DESC;

-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT f.nombre, MAX(p.precio), MIN(p.precio), AVG(p.precio)
FROM fabricante as f
LEFT JOIN producto as p
ON p.codigo_fabricante = f.codigo
WHERE p.nombre IS NOT NULL
GROUP BY f.nombre;

-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
SELECT p.codigo_fabricante, MAX(p.precio), MIN(p.precio), AVG(p.precio), SUM(p.nombre)
FROM producto as p
GROUP BY p.codigo_fabricante
HAVING AVG(p.precio) > 200;

-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT f.nombre, MAX(p.precio), MIN(p.precio), AVG(p.precio), SUM(p.nombre)
FROM fabricante as f
LEFT JOIN producto as p
ON p.codigo_fabricante = f.codigo
WHERE p.nombre IS NOT NULL
GROUP BY f.nombre
HAVING AVG(p.precio) > 200;

-- 20. Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(p.precio)
FROM producto as p
WHERE p.precio >= 180;

-- 21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT fabricante.nombre, count(precio)
FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE precio >= 180
GROUP BY codigo_fabricante;

-- 22. Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
SELECT producto.codigo_fabricante, AVG(precio)
FROM producto
GROUP BY codigo_fabricante;

-- 23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT f.nombre, AVG(precio)
FROM fabricante as f
LEFT JOIN producto as p
ON p.codigo_fabricante = f.codigo
WHERE p.precio IS NOT NULL
GROUP BY codigo_fabricante;

-- 24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT f.nombre, AVG(precio)
FROM fabricante as f
LEFT JOIN producto as p
ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 150
GROUP BY codigo_fabricante;

-- 25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT f.nombre
FROM fabricante as f
LEFT JOIN producto as p
ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
HAVING COUNT(f.nombre) >= 2;

-- 26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
SELECT f.nombre, COUNT(p.nombre)
FROM fabricante as f
LEFT JOIN producto as p
ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 220
GROUP BY f.nombre DESC;

-- 27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
SELECT f.nombre, COUNT(p.nombre)
FROM fabricante as f
LEFT JOIN (SELECT *
          FROM producto
          WHERE precio >= 220) as p
ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
ORDER BY count(p.nombre) DESC;

-- 28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
SELECT f.nombre
FROM fabricante as f
JOIN producto as p
ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
HAVING SUM(p.precio) > 1000;

-- 29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
SELECT p.nombre, MAX(precio), f.nombre
FROM fabricante as f
JOIN producto as p
ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
ORDER BY f.nombre ASC
