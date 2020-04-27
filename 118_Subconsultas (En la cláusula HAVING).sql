------- 1.1.8 Subconsultas (En la cláusula HAVING) -------

-- 07. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
SELECT f1.nombre
FROM fabricante AS f1
LEFT JOIN producto AS p1
ON f1.codigo = p1.codigo_fabricante
GROUP BY f1.nombre
HAVING COUNT(p1.nombre) = (
    SELECT count(p2.nombre)
    FROM fabricante AS f2
    LEFT JOIN producto AS p2
    ON f2.codigo = p2.codigo_fabricante
    WHERE f2.nombre = 'Lenovo')
