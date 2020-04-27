------- 1.1.7 Subconsultas (En la cláusula WHERE) -------


------- 1.1.7.1 Con operadores básicos de comparación -------

-- 01. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT *
FROM producto as p, fabricante as f
WHERE p.codigo_fabricante = f.codigo
AND f.nombre = 'Lenovo';

-- 02. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT *
FROM producto as p
WHERE p.precio = (
  SELECT MAX(precio)
  FROM producto as p, fabricante as f
  WHERE p.codigo_fabricante = f.codigo
  AND f.nombre = 'Lenovo' );

-- 03. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre
FROM producto as p
WHERE p.precio = (
  SELECT MAX(precio)
  FROM producto as p, fabricante as f
  WHERE p.codigo_fabricante = f.codigo
  AND f.nombre = 'Lenovo' );

-- 04. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT p.nombre
FROM producto as p
WHERE p.precio = (
  SELECT MIN(precio)
  FROM producto as p, fabricante as f
  WHERE p.codigo_fabricante = f.codigo
  AND f.nombre = 'Hewlett-Packard' );

-- 05. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT *
FROM producto as p
WHERE p.precio >= (
  SELECT MAX(precio)
  FROM producto as p, fabricante as f
  WHERE p.codigo_fabricante = f.codigo
  AND f.nombre = 'Lenovo' );

-- 06. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT *
FROM producto as p
JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'ASUS'
AND p.precio > (
  SELECT AVG(precio)
  FROM producto as p, fabricante as f
  WHERE p.codigo_fabricante = f.codigo
  AND f.nombre = 'ASUS' );

------- 1.1.7.2 Subconsultas con ALL y ANY -------
-- 08. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT *
FROM producto AS p1
WHERE p1.precio = ALL (
  SELECT precio
  FROM producto AS p2
  WHERE p1.precio < p2.precio );

-- 09. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT *
FROM producto AS p1
WHERE p1.precio = ALL (
  SELECT precio
  FROM producto AS p2
  WHERE p1.precio > p2.precio );

-- 10. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
SELECT f.nombre
FROM fabricante AS f
WHERE f.codigo = ANY (
  SELECT p.codigo_fabricante
  FROM producto AS p);

-- 11. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT f.nombre
FROM fabricante AS f
WHERE f.codigo <> ALL (
  SELECT p.codigo_fabricante
  FROM producto AS p);

------- 1.1.7.3 Subconsultas con IN y NOT IN -------
-- 12. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT f.nombre
FROM fabricante AS f
WHERE f.codigo IN (
  SELECT p.codigo_fabricante
  FROM producto AS p);

-- 13. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT f.nombre
FROM fabricante AS f
WHERE f.codigo NOT IN (
  SELECT p.codigo_fabricante
  FROM producto AS p);

------- 1.1.7.4 Subconsultas con EXISTS y NOT EXISTS -------
-- 14. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT f1.nombre
FROM fabricante AS f1
WHERE EXISTS (
  SELECT f2.nombre
  FROM producto AS p, fabricante as f2
  WHERE p.codigo_fabricante = f2.codigo
  AND f1.nombre = f2.nombre );

-- 15. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT f1.nombre
FROM fabricante AS f1
WHERE NOT EXISTS (
  SELECT f2.nombre
  FROM producto AS p, fabricante as f2
  WHERE p.codigo_fabricante = f2.codigo
  AND f1.nombre = f2.nombre );

------- 1.1.7.5 Subconsultas correlacionadas -------
-- 16. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT f.nombre, p1.nombre, p1.precio
FROM fabricante AS f
JOIN producto AS p1
ON f.codigo = p1.codigo_fabricante
WHERE p1.precio = (
  SELECT MIN(p2.precio)
  FROM producto AS p2
  WHERE p2.codigo_fabricante = p1.codigo_fabricante);

-- 17. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
SELECT *
FROM producto AS p1
WHERE p1.precio >= (
  SELECT AVG(p2.precio)
  FROM producto AS p2
  WHERE p2.codigo_fabricante = p1.codigo_fabricante);

-- 18. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p1.nombre
FROM producto AS p1
JOIN fabricante AS f1
ON p1.codigo_fabricante = f1.codigo
WHERE f1.nombre = 'LENOVO'
AND p1.precio = (
  SELECT MAX(p2.precio)
  FROM producto AS p2
  WHERE p2.codigo_fabricante = p1.codigo_fabricante);
