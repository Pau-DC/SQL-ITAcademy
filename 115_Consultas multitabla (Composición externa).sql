------- 1.1.5 Consultas multitabla (Composición externa) -------

-- 01. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT *
FROM fabricante
LEFT JOIN producto
ON fabricante.codigo = producto.codigo_fabricante;

-- 02. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT *
FROM fabricante
LEFT JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.nombre IS NULL;

-- 03. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
/* NO, NO ÉS POSSIBLE. QUAN HEM CREAT LA BASE DE DADES HEM DEFINIT, DINS DE LA
TAULA DE PRODUCTES, QUE EL VALOR PER codigo_fabricante NO PODIA SER NULL
>> FILE: 112_Base de datos para MySQL.sql
>> LINE 16 || codigo_fabricante INT UNSIGNED NOT NULL
 EN TOT CAS ES PODRIA HAVER ASSIGNAT El codigo_fabricante A UN VALOR QUE NO ESTIGUI
 ASSIGNAT A UN FABRICANT, PERÒ AIXÒ DONARIA UN ERROR EN CREAR LA BBDD */
