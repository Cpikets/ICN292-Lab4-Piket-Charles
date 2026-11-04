# Laboratorio 4 — SQL (1/2)

**ICN-292 · Sistemas de Información para la Gestión**  
Universidad Técnica Federico Santa María — Departamento de Industrias  
**Estudiante:** Charles Piket Silva

## Descripción

El laboratorio reconstruye la base de datos de **Austral Editores** y desarrolla diez consultas SQL para revisar su catálogo y registrar operaciones sobre los datos.

La implementación incluida en este repositorio utiliza **SQLite**, ejecutado desde Visual Studio Code. La base está formada por cuatro tablas: `autores`, `libros`, `colecciones` y `pagos`, vinculadas mediante claves foráneas.

## Archivos del repositorio

```text
ICN292-Lab4-Piket-Charles/
├── README.md
├── ICN292-Lab4-Piket-Charles.pdf
├── ICN292-Lab4-Piket-Charles.tex
├── ICN292-Lab4-Piket-Charles.sql
├── config.tex
├── Logos/
│   ├── header_utfsm.png
│   └── Logo_industrias.png
└── Evidencia_lab4/
    ├── Consulta_01.png
    ├── Consulta_02.png
    ├── Consulta_03.png
    ├── Consulta_04.png
    ├── Consulta_05.png
    ├── Consulta_06.png
    ├── Consulta_07_antes.png
    ├── Consulta_07_despues.png
    ├── Consulta_08_antes.png
    ├── Consulta_08_update.png
    ├── Consulta_08_despues.png
    ├── Consulta_09.png
    ├── Consulta_10_detalle.png
    ├── Consulta_10_totales.png
    └── Modelo_ER_Austral.png
```

- **PDF:** informe con el desarrollo de las diez consultas y sus evidencias.
- **TEX:** fuente del informe en LaTeX. Necesita `config.tex`, los logotipos y las imágenes de `Evidencia_lab4/` para compilar.
- **SQL:** script único que crea las tablas, inserta la carga oficial y ejecuta las consultas en orden.
- **Evidencia_lab4:** capturas de las consultas y diagrama entidad–relación.

## Ejecución

1. Abrir una base de datos SQLite desde un editor o extensión compatible en Visual Studio Code.
2. Abrir `ICN292-Lab4-Piket-Charles.sql`.
3. Ejecutar el script **desde el principio hasta el final**, respetando el orden de las instrucciones.
4. Para comprobar los resultados intermedios de las consultas 7 y 8, ejecutar sus sentencias individualmente en el orden indicado.

**Precaución:** el script comienza con `DROP TABLE IF EXISTS`, por lo que elimina las tablas anteriores antes de volver a crearlas. Si se ejecutan nuevamente solo las sentencias `INSERT` o `UPDATE`, pueden acumularse pagos o ventas y variar los resultados.

## Datos y comprobaciones

La carga oficial incluye **6 autores**, **12 libros** y **24.250 ejemplares vendidos**. Las consultas 1 a 6 se realizan sobre esa carga inicial. Posteriormente, las consultas 7 y 8 prueban la eliminación de un libro y la actualización de ejemplares vendidos; las consultas 9 y 10 incorporan colecciones y pagos de prueba.

## Modelo entidad–relación

![Modelo entidad–relación de Austral Editores](Evidencia_lab4/Modelo_ER_Austral.png)
