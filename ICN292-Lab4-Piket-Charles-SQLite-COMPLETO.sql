PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS pagos;
DROP TABLE IF EXISTS colecciones;
DROP TABLE IF EXISTS autores;

CREATE TABLE autores (
    id_autor INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    pais TEXT,
    genero TEXT NOT NULL
           CHECK (genero IN ('Cómic', 'Ensayo', 'Infantil', 'Novela', 'Poesía'))
);

CREATE TABLE colecciones (
    id_coleccion INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    fecha_publicacion DATE NOT NULL
);

CREATE TABLE libros (
    id_libro INTEGER PRIMARY KEY AUTOINCREMENT,
    id_autor INTEGER NOT NULL,
    id_coleccion INTEGER,
    titulo TEXT NOT NULL,
    paginas INTEGER,
    ejemplares_vendidos INTEGER,
    anio INTEGER,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
    FOREIGN KEY (id_coleccion) REFERENCES colecciones(id_coleccion)
);

CREATE TABLE pagos (
    id_pago INTEGER PRIMARY KEY AUTOINCREMENT,
    id_autor INTEGER NOT NULL,
    fecha_pago DATE NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

INSERT INTO autores (nombre, pais, genero) VALUES
('Elena Pizarro', 'Chile', 'Novela'),
('Harold Finch', 'Inglaterra', 'Ensayo'),
('Rodrigo Bahamonde', 'Chile', 'Poesía'),
('Valentina Correa', 'Argentina', 'Infantil'),
('Nora Keller', 'Estados Unidos', 'Novela'),
('Kenji Arakawa', NULL, 'Cómic');

INSERT INTO libros (id_autor, titulo, paginas, ejemplares_vendidos, anio) VALUES
(1, 'Cielo de Enero', 210, 1500, 2024),
(1, 'Marea Baja', 185, 800, 2023),
(1, 'El Norte', 200, 2200, 2024),
(2, 'Estrellas que Caen', 240, 3000, 2022),
(2, 'Máquinas', 215, 450, 2024),
(3, 'Luz Artificial', 300, 1200, 2024),
(3, 'Ruido Blanco', 280, 600, 2023),
(4, 'El Barrio de Lila', 190, 5000, 2024),
(4, 'Antes del Amanecer', 205, 2700, 2024),
(4, 'La Calle 8', 175, 900, 2023),
(5, 'Flor de Hierro', 195, 4100, 2024),
(5, 'Hora Dorada', 220, 1800, 2022);


SELECT nombre, genero
FROM autores
WHERE pais <> 'Chile' OR pais IS NULL
ORDER BY nombre;

SELECT titulo, paginas
FROM libros
WHERE paginas BETWEEN 190 AND 220
ORDER BY paginas, titulo;

SELECT COUNT(*) AS cantidad_libros,
       SUM(ejemplares_vendidos) AS total_ejemplares_vendidos,
       ROUND(AVG(paginas), 2) AS promedio_paginas,
       MIN(anio) AS anio_mas_antiguo,
       MAX(ejemplares_vendidos) AS mayor_venta_individual
FROM libros;

SELECT DISTINCT genero
FROM autores
ORDER BY genero;

SELECT a.nombre, COUNT(l.id_libro) AS libros_2024
FROM autores a
JOIN libros l ON a.id_autor = l.id_autor
WHERE l.anio = 2024
GROUP BY a.id_autor, a.nombre
HAVING COUNT(l.id_libro) > 1
ORDER BY a.nombre;

SELECT titulo, ejemplares_vendidos
FROM libros
WHERE anio = 2024 AND ejemplares_vendidos > 2000
ORDER BY ejemplares_vendidos DESC
LIMIT 3;

INSERT INTO libros (id_autor, titulo, paginas, ejemplares_vendidos, anio)
VALUES (3, 'Papel Mojado', 260, 50, 2024);

SELECT titulo, paginas, ejemplares_vendidos, anio
FROM libros
WHERE titulo = 'Papel Mojado';

DELETE FROM libros
WHERE titulo = 'Papel Mojado';

SELECT titulo, paginas, ejemplares_vendidos, anio
FROM libros
WHERE titulo = 'Papel Mojado';

SELECT titulo, ejemplares_vendidos
FROM libros
WHERE titulo = 'Cielo de Enero';

UPDATE libros
SET ejemplares_vendidos = ejemplares_vendidos + 100
WHERE titulo = 'Cielo de Enero';

SELECT titulo, ejemplares_vendidos
FROM libros
WHERE titulo = 'Cielo de Enero';

INSERT INTO colecciones (titulo, fecha_publicacion) VALUES
('Horizontes Australes', '2024-01-15'),
('Letras del Mundo', '2023-06-20');

UPDATE libros
SET id_coleccion = 1
WHERE id_libro IN (1, 2, 3, 6, 7, 8, 9, 10);

UPDATE libros
SET id_coleccion = 2
WHERE id_libro IN (4, 5, 11, 12);

SELECT l.titulo AS titulo_libro,
       c.titulo AS titulo_coleccion,
       c.fecha_publicacion
FROM libros l
JOIN colecciones c ON l.id_coleccion = c.id_coleccion
ORDER BY l.titulo;

INSERT INTO pagos (id_autor, fecha_pago, monto) VALUES
(1, '2024-05-15', 1250000.00),
(1, '2024-11-10', 750000.00),
(3, '2024-08-25', 980000.00);

SELECT a.nombre, p.fecha_pago, p.monto
FROM pagos p
JOIN autores a ON p.id_autor = a.id_autor
ORDER BY a.nombre, p.fecha_pago;

SELECT a.nombre, SUM(p.monto) AS total_pagado
FROM pagos p
JOIN autores a ON p.id_autor = a.id_autor
GROUP BY a.id_autor, a.nombre
ORDER BY a.nombre;
