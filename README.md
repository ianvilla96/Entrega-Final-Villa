# Entrega-Final-Villa

## Descripción
Esta base de datos está diseñada para gestionar información relacionada con el turismo, incluyendo ciudades, hoteles, atracciones turísticas, restaurantes y sus respectivas facilidades y tipos de comida. Su objetivo es centralizar y organizar la información para facilitar la consulta y el análisis de datos turísticos, optimizando así la gestión de información en el sector.

## Objetivo
Permitir la consulta rápida de información turística relevante, como encontrar hoteles con ciertas facilidades, listar atracciones en ciudades específicas y mostrar opciones de restaurantes según el tipo de cocina. Este sistema es útil para operadores turísticos, turistas y gestores de servicios turísticos, brindando una estructura robusta para consultas complejas de información relacionada con turismo.

## Alcance del Proyecto
El sistema abarca varias entidades fundamentales del sector turístico:
- **Cities (Ciudades)**: Tabla que contiene las ciudades donde se ubican hoteles, restaurantes y atracciones turísticas.
- **Hotels (Hoteles)**: Almacena los hoteles disponibles en cada ciudad, incluyendo su nombre y clasificación en estrellas.
- **Facilities (Facilidades)**: Contiene las diferentes facilidades o servicios disponibles, como WiFi, piscina, etc.
- **Restaurants (Restaurantes)**: Registra los restaurantes en cada ciudad y se relaciona con los tipos de comida.
- **Things_of_Interest (Lugares de Interés)**: Almacena información sobre las atracciones turísticas en cada ciudad.
- **Visitors_Comments (Comentarios de Visitantes)**: Registra los comentarios de visitantes sobre los lugares de interés turístico.

## Diagrama ER
![Descripción de la imagen](ruta/imagen.png)  <!-- Actualizar con la ruta de la imagen al subirla -->


## Problemática y Solución
### Problemática: Gestión Completa y Accesible de Información Turística
La gestión de información de turismo es compleja y requiere centralización para brindar datos actualizados sobre ubicaciones, servicios y experiencias disponibles. Las empresas y autoridades locales necesitan una forma organizada de almacenar y consultar datos clave para mejorar la experiencia del visitante y la eficiencia operativa.

### Solución: Base de Datos Relacional para la Gestión de Turismo
La base de datos relacional `TurismoDB` optimiza la gestión turística al centralizar la información, mejorar la experiencia de usuario y asegurar la integridad de los datos mediante triggers y funciones SQL. Esta solución permite:
- **Centralizar** la información de hoteles, atracciones turísticas, restaurantes y servicios en múltiples ciudades.
- **Optimizar el acceso** a datos a través de vistas y consultas específicas.
- **Mejorar la experiencia del visitante** al disponer de una estructura que facilita la información en tiempo real.
- **Asegurar la consistencia** de los datos mediante triggers y funciones que mantienen la integridad referencial y evitan errores de inserción y eliminación.

---

## Listado de Tablas

### Tabla: Cities
- **Descripción**: Almacena información sobre las ciudades en las que se encuentran los hoteles, restaurantes y lugares de interés turístico.
- **Columnas**:
  - `id_city` (INT, PRIMARY KEY, AUTO_INCREMENT): Identificador único de cada ciudad.
  - `city_name` (VARCHAR(100), NOT NULL): Nombre de la ciudad.

### Tabla: Hotels
- **Descripción**: Registra los hoteles disponibles en cada ciudad, incluyendo su nombre y clasificación en estrellas.
- **Columnas**:
  - `id_hotel` (INT, PRIMARY KEY, AUTO_INCREMENT): Identificador único de cada hotel.
  - `hotel_name` (VARCHAR(100), NOT NULL): Nombre del hotel.
  - `stars` (INT, NOT NULL): Clasificación en estrellas del hotel.
  - `id_city` (INT, FOREIGN KEY): Identificador de la ciudad donde se ubica el hotel.

### Tabla: Facilities
- **Descripción**: Contiene los distintos tipos de facilidades que pueden ofrecer los hoteles (piscina, gimnasio, etc.).
- **Columnas**:
  - `id_facility` (INT, PRIMARY KEY, AUTO_INCREMENT): Identificador único de cada facilidad.
  - `facility_name` (VARCHAR(100), NOT NULL): Nombre de la facilidad.

### Tabla: Hotel_Facilities
- **Descripción**: Tabla intermedia que permite la relación muchos a muchos entre hoteles y facilidades.
- **Columnas**:
  - `id_hotel` (INT, PRIMARY KEY, FOREIGN KEY): Identificador del hotel.
  - `id_facility` (INT, PRIMARY KEY, FOREIGN KEY): Identificador de la facilidad.

### Tabla: Restaurants
- **Descripción**: Almacena información sobre los restaurantes ubicados en las distintas ciudades.
- **Columnas**:
  - `id_restaurant` (INT, PRIMARY KEY, AUTO_INCREMENT): Identificador único de cada restaurante.
  - `restaurant_name` (VARCHAR(100), NOT NULL): Nombre del restaurante.
  - `id_city` (INT, FOREIGN KEY): Identificador de la ciudad donde se encuentra el restaurante.

### Tabla: Ref_Types_of_Food
- **Descripción**: Lista los tipos de comida que ofrecen los restaurantes (italiana, japonesa, mexicana, etc.).
- **Columnas**:
  - `id_food_type` (INT, PRIMARY KEY, AUTO_INCREMENT): Identificador único de cada tipo de comida.
  - `food_type_name` (VARCHAR(50), NOT NULL): Nombre del tipo de comida.

### Tabla: Restaurant_Types_of_Food
- **Descripción**: Tabla intermedia que permite la relación muchos a muchos entre restaurantes y tipos de comida.
- **Columnas**:
  - `id_restaurant` (INT, PRIMARY KEY, FOREIGN KEY): Identificador del restaurante.
  - `id_food_type` (INT, PRIMARY KEY, FOREIGN KEY): Identificador del tipo de comida.

### Tabla: Things_of_Interest
- **Descripción**: Almacena información sobre los lugares de interés turístico en cada ciudad.
- **Columnas**:
  - `id_toi` (INT, PRIMARY KEY, AUTO_INCREMENT): Identificador único del lugar de interés.
  - `toi_name` (VARCHAR(100), NOT NULL): Nombre del lugar de interés.
  - `description` (TEXT): Descripción del lugar de interés.
  - `id_city` (INT, FOREIGN KEY): Identificador de la ciudad donde se encuentra el lugar de interés.

### Tabla: Visitors_Comments
- **Descripción**: Contiene los comentarios de los visitantes sobre los lugares de interés turístico.
- **Columnas**:
  - `id_comment` (INT, PRIMARY KEY, AUTO_INCREMENT): Identificador único de cada comentario.
  - `comment_text` (TEXT): Texto del comentario.
  - `visitor_name` (VARCHAR(100)): Nombre del visitante.
  - `id_toi` (INT, FOREIGN KEY): Identificador del lugar de interés turístico asociado al comentario.

### Tabla: Photos
- **Descripción**: Almacena URLs de fotos relacionadas con las atracciones turísticas.
- **Columnas**:
  - `id_photo` (INT, PRIMARY KEY, AUTO_INCREMENT): Identificador único de cada foto.
  - `photo_url` (VARCHAR(255), NOT NULL): URL de la foto.
  - `id_attraction` (INT, FOREIGN KEY): Identificador de la atracción turística asociada a la foto.

### Tabla: Relatives
- **Descripción**: Registra familiares de los visitantes, permitiendo un registro de relaciones familiares en la base de datos.
- **Columnas**:
  - `id_relative` (INT, PRIMARY KEY, AUTO_INCREMENT): Identificador único de cada familiar.
  - `relative_name` (VARCHAR(100), NOT NULL): Nombre del familiar.
  - `relationship` (VARCHAR(50), NOT NULL): Tipo de relación (p. ej., padre, madre, etc.).

## Ejemplos de Consultas
1. **Listar todas las ciudades**:
   ```sql
   SELECT * FROM Cities;
