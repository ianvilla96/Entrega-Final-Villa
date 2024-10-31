CREATE DATABASE TurismoDB;

USE TurismoDB;


CREATE TABLE Cities (
    id_city INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL
);


CREATE TABLE Hotels (
    id_hotel INT AUTO_INCREMENT PRIMARY KEY,
    hotel_name VARCHAR(100) NOT NULL,
    stars INT NOT NULL,
    id_city INT,
    FOREIGN KEY (id_city) REFERENCES Cities(id_city)
);


CREATE TABLE Addresses (
    id_address INT AUTO_INCREMENT PRIMARY KEY,
    street_name VARCHAR(150) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    id_city INT,
    FOREIGN KEY (id_city) REFERENCES Cities(id_city)
);


CREATE TABLE Things_of_Interest (
    id_toi INT AUTO_INCREMENT PRIMARY KEY,
    toi_name VARCHAR(100) NOT NULL,
    description TEXT,
    id_city INT,
    FOREIGN KEY (id_city) REFERENCES Cities(id_city)
);


CREATE TABLE Ref_TOI_Types (
    id_toi_type INT AUTO_INCREMENT PRIMARY KEY,
    toi_type_name VARCHAR(50) NOT NULL
);


CREATE TABLE Visitors_Comments (
    id_comment INT AUTO_INCREMENT PRIMARY KEY,
    comment_text TEXT,
    visitor_name VARCHAR(100),
    id_toi INT,
    FOREIGN KEY (id_toi) REFERENCES Things_of_Interest(id_toi)
);


CREATE TABLE Tourist_Attractions (
    id_attraction INT AUTO_INCREMENT PRIMARY KEY,
    attraction_name VARCHAR(100) NOT NULL,
    description TEXT,
    id_city INT,
    FOREIGN KEY (id_city) REFERENCES Cities(id_city)
);


CREATE TABLE Facilities (
    id_facility INT AUTO_INCREMENT PRIMARY KEY,
    facility_name VARCHAR(100) NOT NULL
);


CREATE TABLE Hotel_Facilities (
    id_hotel INT,
    id_facility INT,
    PRIMARY KEY (id_hotel, id_facility),
    FOREIGN KEY (id_hotel) REFERENCES Hotels(id_hotel),
    FOREIGN KEY (id_facility) REFERENCES Facilities(id_facility)
);


CREATE TABLE Restaurants (
    id_restaurant INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    id_city INT,
    FOREIGN KEY (id_city) REFERENCES Cities(id_city)
);


CREATE TABLE Ref_Types_of_Food (
    id_food_type INT AUTO_INCREMENT PRIMARY KEY,
    food_type_name VARCHAR(50) NOT NULL
);


CREATE TABLE Restaurant_Types_of_Food (
    id_restaurant INT,
    id_food_type INT,
    PRIMARY KEY (id_restaurant, id_food_type),
    FOREIGN KEY (id_restaurant) REFERENCES Restaurants(id_restaurant),
    FOREIGN KEY (id_food_type) REFERENCES Ref_Types_of_Food(id_food_type)
);

CREATE TABLE Photos (
    id_photo INT AUTO_INCREMENT PRIMARY KEY,
    photo_url VARCHAR(255) NOT NULL,
    id_attraction INT,
    FOREIGN KEY (id_attraction) REFERENCES Tourist_Attractions(id_attraction)
);

CREATE TABLE Relatives (
    id_relative INT AUTO_INCREMENT PRIMARY KEY,
    relative_name VARCHAR(100) NOT NULL,
    relationship VARCHAR(50) NOT NULL
);

INSERT INTO Facilities (facility_name) VALUES 
('Piscina'), 
('Gimnasio'), 
('Spa'), 
('Estacionamiento'), 
('WiFi Gratis');

INSERT INTO Cities (city_name) VALUES
('Buenos Aires'),
('Madrid'),
('Barcelona'),
('Roma'),
('París'),
('Berlín'),
('Londres'),
('Ámsterdam'),
('Bruselas'),
('Lisboa'),
('Atenas'),
('Moscú'),
('San Petersburgo'),
('Sídney'),
('Melbourne'),
('Tokio'),
('Kioto'),
('Osaka'),
('Pekín'),
('Shanghái'),
('Hong Kong'),
('Singapur'),
('Seúl'),
('Bangkok'),
('Dubai'),
('Abu Dhabi'),
('Doha'),
('Ciudad de México'),
('Guadalajara'),
('Monterrey'),
('Bogotá'),
('Medellín'),
('Lima'),
('Santiago'),
('Valparaíso'),
('Caracas'),
('Río de Janeiro'),
('Sao Paulo'),
('Montevideo'),
('Asunción'),
('La Paz'),
('Quito'),
('Guayaquil'),
('San José'),
('Panamá'),
('Ciudad de Guatemala'),
('Tegucigalpa'),
('San Salvador'),
('Managua');

INSERT INTO Hotels (hotel_name, stars, id_city) VALUES
('Hotel Libertador', 5, 1),
('Hotel Gran Madrid', 5, 2),
('Hotel Mediterráneo', 4, 3),
('Hotel Roma Imperial', 5, 4),
('Hotel Torre Eiffel', 5, 5),
('Hotel Brandenburgo', 4, 6),
('Hotel Londres Central', 5, 7),
('Hotel Tulipanes', 4, 8),
('Hotel Plaza Real', 4, 9),
('Hotel Miramar', 4, 10),
('Hotel Acrópolis', 3, 11),
('Hotel Kremlin', 5, 12),
('Hotel Nevsky Palace', 5, 13),
('Hotel Bahía Sídney', 5, 14),
('Hotel Victoria', 4, 15),
('Hotel Sol Naciente', 5, 16),
('Hotel Kiyomizu', 4, 17),
('Hotel Osaka Royal', 4, 18),
('Hotel Gran Muralla', 5, 19),
('Hotel Shanghái Plaza', 4, 20),
('Hotel Mar del Sur', 5, 21),
('Hotel Jardines Orientales', 5, 22),
('Hotel Seoul Tower', 5, 23),
('Hotel Bangkok Deluxe', 4, 24),
('Hotel Palmera Real', 5, 25),
('Hotel Duna de Oro', 5, 26),
('Hotel Al Jazeera', 4, 27),
('Hotel Azteca', 5, 28),
('Hotel Guadalajara Central', 4, 29),
('Hotel Regio Monterrey', 4, 30),
('Hotel Andino', 5, 31),
('Hotel Paisa', 4, 32),
('Hotel Inca', 4, 33),
('Hotel Pacífico', 5, 34),
('Hotel Caracas Royal', 4, 35),
('Hotel Copacabana', 5, 36),
('Hotel Sao Paulo Deluxe', 5, 37),
('Hotel Río Plata', 4, 38),
('Hotel Punta del Este', 5, 39),
('Hotel Asunción Central', 4, 40),
('Hotel Altiplano', 3, 41),
('Hotel Quito Imperial', 4, 42),
('Hotel Costa del Sol', 5, 43),
('Hotel San José Real', 5, 44),
('Hotel Canal de Panamá', 4, 45),
('Hotel Guatemalteco', 4, 46),
('Hotel Maya Real', 4, 47),
('Hotel San Salvador Imperial', 4, 48),
('Hotel Nicaragüense', 3, 49),
('Hotel Tropical Managua', 4, 50);

INSERT INTO Hotel_Facilities (id_hotel, id_facility) VALUES 
(1, 1),  -- Hotel Libertador tiene Piscina
(1, 2),  -- Hotel Libertador tiene Gimnasio
(2, 3),  -- Hotel Gran Madrid tiene Spa
(2, 4),  -- Hotel Gran Madrid tiene Estacionamiento
(3, 5),  -- Hotel Mediterráneo tiene WiFi Gratis
(3, 1);  -- Hotel Mediterráneo tiene Piscina

INSERT INTO Restaurants (restaurant_name, id_city) VALUES
('La Estancia', 1),
('El Buen Comer', 2),
('La Paella', 3),
('Trattoria Roma', 4),
('Café Parisino', 5),
('Sabor Alemán', 6),
('Fish & Chips', 7),
('Tulipanes Gourmet', 8),
('Sabores de Bruselas', 9),
('Fado y Vino', 10),
('Acrópolis Grill', 11),
('Sabor Ruso', 12),
('Nevsky Bar & Grill', 13),
('Sidney Harbour', 14),
('Victoria Bites', 15),
('Sushi Palace', 16),
('Kiyomizu Cocina', 17),
('Osaka Fusion', 18),
('Gran Muralla Taste', 19),
('Sabores de Shanghái', 20),
('Oriente Delicioso', 21),
('Singapur Street Food', 22),
('Seúl BBQ', 23),
('Thai Delights', 24),
('Oasis Árabe', 25),
('Palacio Real Árabe', 26),
('Azteca Grill', 27),
('Mariachi y Sazón', 28),
('Tacos & Mezcal', 29),
('Monterrey Parrilla', 30),
('Andes Culinario', 31),
('Paisa Festín', 32),
('Inca Tradicional', 33),
('Sabores del Pacífico', 34),
('Caracas Food', 35),
('Copacabana Sabor', 36),
('Sao Paulo Gourmet', 37),
('Río Taste', 38),
('Punta del Este Sabores', 39),
('Asunción Grill', 40),
('Altiplano Culinario', 41),
('Quito Gourmet', 42),
('Costa y Sabor', 43),
('San José Grill', 44),
('Panamá Fusión', 45),
('Comida Guatemalteca', 46),
('Sabores Mayas', 47),
('San Salvador BBQ', 48),
('Nicaragua Fest', 49),
('Tropical Taste', 50);

INSERT INTO Ref_Types_of_Food (food_type_name) VALUES
('Italiana'),
('Francesa'),
('Japonesa'),
('Argentina'),
('Mexicana'),
('Española'),
('China'),
('Brasileña'),
('Mediterránea'),
('Árabe');

INSERT INTO Things_of_Interest (toi_name, description, id_city) VALUES
('Obelisco', 'Monumento histórico en el centro de Buenos Aires.', 1),
('Museo del Prado', 'Uno de los museos de arte más famosos del mundo.', 2),
('La Sagrada Familia', 'Basílica icónica diseñada por Gaudí en Barcelona.', 3),
('El Coliseo', 'Famoso anfiteatro romano en el centro de Roma.', 4),
('La Torre Eiffel', 'Ícono de París y una de las estructuras más reconocibles del mundo.', 5),
('La Puerta de Brandeburgo', 'Monumento histórico en Berlín.', 6),
('El Palacio de Buckingham', 'Residencia oficial de la monarquía británica en Londres.', 7),
('Casa de Ana Frank', 'Museo dedicado a Ana Frank en Ámsterdam.', 8),
('Atomium', 'Estructura icónica en Bruselas.', 9),
('Castillo de San Jorge', 'Castillo en Lisboa con vistas impresionantes.', 10),
('La Acrópolis', 'Conjunto arquitectónico histórico en Atenas.', 11),
('La Plaza Roja', 'Plaza famosa en el centro de Moscú.', 12),
('Museo del Hermitage', 'Famoso museo de arte en San Petersburgo.', 13),
('Opera House', 'Icono de la arquitectura moderna en Sídney.', 14),
('Jardín Botánico de Melbourne', 'Extensos jardines en el centro de Melbourne.', 15),
('Templo Senso-ji', 'El templo más antiguo de Tokio.', 16),
('Santuario de Fushimi Inari', 'Santuario con miles de torii rojos en Kioto.', 17),
('Castillo de Osaka', 'Imponente castillo histórico en Osaka.', 18),
('Ciudad Prohibida', 'Complejo imperial en el corazón de Pekín.', 19),
('Jardín Yu', 'Jardín clásico chino en Shanghái.', 20),
('Victoria Peak', 'Famosa colina en Hong Kong con vistas panorámicas.', 21),
('Marina Bay Sands', 'Complejo icónico en Singapur.', 22),
('Palacio de Gyeongbokgung', 'Histórico palacio en Seúl.', 23),
('Gran Palacio', 'Residencia real en Bangkok.', 24),
('Burj Khalifa', 'El edificio más alto del mundo en Dubái.', 25),
('Gran Mezquita Sheikh Zayed', 'Espectacular mezquita en Abu Dhabi.', 26),
('Souq Waqif', 'Mercado tradicional en Doha.', 27),
('Templo Mayor', 'Sitio arqueológico azteca en Ciudad de México.', 28),
('Teatro Degollado', 'Teatro neoclásico en Guadalajara.', 29),
('Paseo Santa Lucía', 'Famoso paseo en Monterrey.', 30),
('Monserrate', 'Iglesia con vistas en Bogotá.', 31),
('Pueblito Paisa', 'Atracción cultural en Medellín.', 32),
('Huaca Pucllana', 'Sitio arqueológico en Lima.', 33),
('Cerro San Cristóbal', 'Mirador con vistas panorámicas de Santiago.', 34),
('Casa Natal de Simón Bolívar', 'Museo en Caracas dedicado a Bolívar.', 35),
('Cristo Redentor', 'Estatua icónica en Río de Janeiro.', 36),
('Museo de Arte de São Paulo', 'Famoso museo en São Paulo.', 37),
('La Rambla de Montevideo', 'Paseo marítimo en Montevideo.', 39),
('Costanera de Asunción', 'Paseo en la ciudad de Asunción.', 40),
('Valle de la Luna', 'Impresionante valle en La Paz.', 41),
('Mitad del Mundo', 'Monumento en Quito que marca la línea ecuatorial.', 42),
('Malecón 2000', 'Paseo a lo largo del río en Guayaquil.', 43),
('Teatro Nacional', 'Importante teatro en San José.', 44),
('Canal de Panamá', 'Obra de ingeniería que conecta el Atlántico y el Pacífico.', 45),
('Parque Central', 'Importante parque en Ciudad de Guatemala.', 46),
('Cerro Juana Laínez', 'Mirador en Tegucigalpa.', 47),
('Volcán de Izalco', 'Famoso volcán en San Salvador.', 48),
('Catedral de Managua', 'Catedral de la ciudad.', 49),
('Lago de Nicaragua', 'Lago de gran importancia en Managua.', 50);

INSERT INTO Restaurant_Types_of_Food (id_restaurant, id_food_type) VALUES
(1, 4), -- La Estancia sirve comida Argentina
(2, 6), -- El Buen Comer sirve comida Española
(3, 6), -- La Paella sirve comida Española
(4, 1), -- Trattoria Roma sirve comida Italiana
(5, 2), -- Café Parisino sirve comida Francesa
(6, 7), -- Sabor Alemán sirve comida Alemana
(7, 5), -- Fish & Chips sirve comida Británica
(8, 6), -- Tulipanes Gourmet sirve comida Holandesa
(9, 9), -- Sabores de Bruselas sirve comida Belga
(10, 9), -- Fado y Vino sirve comida Portuguesa
(11, 9), -- Acrópolis Grill sirve comida Griega
(12, 8), -- Sabor Ruso sirve comida Rusa
(13, 8), -- Nevsky Bar & Grill sirve comida Rusa
(14, 9), -- Sidney Harbour sirve comida Australiana
(15, 9), -- Victoria Bites sirve comida Australiana
(16, 3), -- Sushi Palace sirve comida Japonesa
(17, 3), -- Kiyomizu Cocina sirve comida Japonesa
(18, 3), -- Osaka Fusion sirve comida Japonesa
(19, 7), -- Gran Muralla Taste sirve comida China
(20, 7), -- Sabores de Shanghái sirve comida China
(21, 7), -- Oriente Delicioso sirve comida China
(22, 7), -- Singapur Street Food sirve comida Singapurense
(23, 7), -- Seúl BBQ sirve comida Coreana
(24, 9), -- Thai Delights sirve comida Tailandesa
(25, 10), -- Oasis Árabe sirve comida Árabe
(26, 10), -- Palacio Real Árabe sirve comida Árabe
(27, 5), -- Azteca Grill sirve comida Mexicana
(28, 5), -- Mariachi y Sazón sirve comida Mexicana
(29, 5), -- Tacos & Mezcal sirve comida Mexicana
(30, 4), -- Monterrey Parrilla sirve comida Mexicana
(31, 9), -- Andes Culinario sirve comida Peruana
(32, 9), -- Paisa Festín sirve comida Colombiana
(33, 9), -- Inca Tradicional sirve comida Peruana
(34, 9), -- Sabores del Pacífico sirve comida Costarricense
(35, 9), -- Caracas Food sirve comida Venezolana
(36, 8), -- Copacabana Sabor sirve comida Brasileña
(37, 8), -- Sao Paulo Gourmet sirve comida Brasileña
(38, 8), -- Río Taste sirve comida Brasileña
(39, 9), -- Punta del Este Sabores sirve comida Uruguaya
(40, 9), -- Asunción Grill sirve comida Paraguaya
(41, 9), -- Altiplano Culinario sirve comida Boliviana
(42, 9), -- Quito Gourmet sirve comida Ecuatoriana
(43, 9), -- Costa y Sabor sirve comida Ecuatoriana
(44, 9), -- San José Grill sirve comida Costarricense
(45, 9), -- Panamá Fusión sirve comida Panameña
(46, 9), -- Comida Guatemalteca sirve comida Guatemalteca
(47, 9), -- Sabores Mayas sirve comida Guatemalteca
(48, 9), -- San Salvador BBQ sirve comida Salvadoreña
(49, 9), -- Nicaragua Fest sirve comida Nicaragüense
(50, 9); -- Tropical Taste sirve comida Nicaragüense

INSERT INTO Photos (photo_url, id_attraction) VALUES
('https://example.com/obelisco.jpg', 1),
('https://example.com/torre_eiffel.jpg', 5),
('https://example.com/coliseo.jpg', 4);

-- 1. Listar todas las ciudades disponibles
SELECT * FROM Cities;

-- 2. Listar todos los hoteles con sus ciudades y su cantidad de estrellas
SELECT Hotels.hotel_name, Cities.city_name, Hotels.stars
FROM Hotels
INNER JOIN Cities ON Hotels.id_city = Cities.id_city;

-- 3. Listar todos los restaurantes junto con el tipo de comida que ofrecen
SELECT Restaurants.restaurant_name, Cities.city_name, Ref_Types_of_Food.food_type_name
FROM Restaurants
INNER JOIN Cities ON Restaurants.id_city = Cities.id_city
INNER JOIN Restaurant_Types_of_Food ON Restaurants.id_restaurant = Restaurant_Types_of_Food.id_restaurant
INNER JOIN Ref_Types_of_Food ON Restaurant_Types_of_Food.id_food_type = Ref_Types_of_Food.id_food_type
LIMIT 10;

-- 4. Mostrar todos los hoteles que tienen 5 estrellas
SELECT hotel_name, stars
FROM Hotels
WHERE stars = 5;

-- 5. Listar todos los lugares de interés turístico junto con el nombre de la ciudad en que se encuentran
SELECT Things_of_Interest.toi_name, Things_of_Interest.description, Cities.city_name
FROM Things_of_Interest
INNER JOIN Cities ON Things_of_Interest.id_city = Cities.id_city;



-- 6. Listar los hoteles que tienen la facilidad de "Piscina" (Swimming Pool)
SELECT Hotels.hotel_name, Facilities.facility_name
FROM Hotels
INNER JOIN Hotel_Facilities ON Hotels.id_hotel = Hotel_Facilities.id_hotel
INNER JOIN Facilities ON Hotel_Facilities.id_facility = Facilities.id_facility
WHERE Facilities.facility_name = 'Piscina';

-- 7. Listar todos los lugares de interés turístico
SELECT toi_name, description
FROM Things_of_Interest;


-- 8. Contar cuántos hoteles hay en una ciudad específica, por ejemplo, "Buenos Aires"
SELECT COUNT(Hotels.id_hotel) AS total_hotels
FROM Hotels
INNER JOIN Cities ON Hotels.id_city = Cities.id_city
WHERE Cities.city_name = 'Buenos Aires';

-- 9. Mostrar todos los restaurantes en una ciudad específica que sirven un tipo de comida particular, por ejemplo, "Italiana" en "Roma"
SELECT Restaurants.restaurant_name, Ref_Types_of_Food.food_type_name
FROM Restaurants
INNER JOIN Cities ON Restaurants.id_city = Cities.id_city
INNER JOIN Restaurant_Types_of_Food ON Restaurants.id_restaurant = Restaurant_Types_of_Food.id_restaurant
INNER JOIN Ref_Types_of_Food ON Restaurant_Types_of_Food.id_food_type = Ref_Types_of_Food.id_food_type
WHERE Ref_Types_of_Food.food_type_name = 'Italiana'
AND Cities.city_name = 'Roma';

-- 10. Mostrar los hoteles con más de una facilidad disponible
SELECT Hotels.hotel_name, COUNT(Hotel_Facilities.id_facility) AS total_facilities
FROM Hotels
INNER JOIN Hotel_Facilities ON Hotels.id_hotel = Hotel_Facilities.id_hotel
GROUP BY Hotels.hotel_name
HAVING COUNT(Hotel_Facilities.id_facility) > 1;

-- 11. Listar todas las facilidades que están disponibles en los hoteles de "Madrid"
SELECT Hotels.hotel_name, Facilities.facility_name
FROM Hotels
INNER JOIN Hotel_Facilities ON Hotels.id_hotel = Hotel_Facilities.id_hotel
INNER JOIN Facilities ON Hotel_Facilities.id_facility = Facilities.id_facility
INNER JOIN Cities ON Hotels.id_city = Cities.id_city
WHERE Cities.city_name = 'Madrid';


-- Vista 1: Hoteles y sus Facilidades
-- Propósito: Esta vista, llamada "Vista_Hoteles_Facilidades", muestra los hoteles junto con cada facilidad que ofrecen.
-- Permite acceder fácilmente a la información sobre las instalaciones de cada hotel sin tener que escribir consultas complejas.

CREATE VIEW Vista_Hoteles_Facilidades AS
SELECT Hotels.hotel_name AS Hotel, Facilities.facility_name AS Facilidad
FROM Hotels
INNER JOIN Hotel_Facilities ON Hotels.id_hotel = Hotel_Facilities.id_hotel
INNER JOIN Facilities ON Hotel_Facilities.id_facility = Facilities.id_facility;

-- Para consultar esta vista:
SELECT * FROM Vista_Hoteles_Facilidades;

------------------------------------------------------------

-- Vista 2: Restaurantes con Tipo de Comida y Ciudad
-- Propósito: Esta vista, llamada "Vista_Restaurantes_Comida_Ciudad", muestra los restaurantes junto con el tipo de comida que ofrecen y la ciudad en la que se encuentran.
-- Es útil para conocer qué tipo de comida ofrece cada restaurante y su ubicación sin escribir consultas largas.

CREATE VIEW Vista_Restaurantes_Comida_Ciudad AS
SELECT Restaurants.restaurant_name AS Restaurante, Ref_Types_of_Food.food_type_name AS Tipo_de_Comida, Cities.city_name AS Ciudad
FROM Restaurants
INNER JOIN Restaurant_Types_of_Food ON Restaurants.id_restaurant = Restaurant_Types_of_Food.id_restaurant
INNER JOIN Ref_Types_of_Food ON Restaurant_Types_of_Food.id_food_type = Ref_Types_of_Food.id_food_type
INNER JOIN Cities ON Restaurants.id_city = Cities.id_city;

-- Para consultar esta vista:
SELECT * FROM Vista_Restaurantes_Comida_Ciudad;
;

-- Función: Contar Facilidades por Hotel
-- Propósito: La función "Contar_Facilidades_Por_Hotel" devuelve la cantidad de facilidades asociadas a un hotel específico.
-- Esta función recibe el ID de un hotel y devuelve un número entero con la cantidad de facilidades que tiene ese hotel.

DELIMITER //

CREATE FUNCTION Contar_Facilidades_Por_Hotel(idHotel INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidadFacilidades INT;

    -- Contamos el número de facilidades asociadas al hotel
    SELECT COUNT(*) INTO cantidadFacilidades
    FROM Hotel_Facilities
    WHERE id_hotel = idHotel;

    RETURN cantidadFacilidades;
END //

DELIMITER ;

-- Para utilizar la función, puedes ejecutar:
SELECT Contar_Facilidades_Por_Hotel(1); -- Reemplaza el "1" con el ID del hotel que deseas consultar.



-- ========================================
-- Triggers 
-- ========================================

-- Trigger para evitar insertar comentarios en lugares de interés no existentes
DELIMITER //
CREATE TRIGGER before_insert_comment
BEFORE INSERT ON Visitors_Comments
FOR EACH ROW
BEGIN
    DECLARE existeTOI INT;
    SELECT COUNT(*) INTO existeTOI FROM Things_of_Interest WHERE id_toi = NEW.id_toi;
    IF existeTOI = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El lugar de interés no existe';
    END IF;
END //
DELIMITER ;

-- Trigger para manejar la eliminación de una ciudad
-- Si se elimina una ciudad, las direcciones asociadas quedan con id_city en NULL
DELIMITER //
CREATE TRIGGER after_delete_city
AFTER DELETE ON Cities
FOR EACH ROW
BEGIN
    UPDATE Addresses SET id_city = NULL WHERE id_city = OLD.id_city;
END //
DELIMITER ;


-- ========================================
-- Constraints 
-- ========================================

-- Limitar el rango de estrellas en hoteles (1 a 5)
ALTER TABLE Hotels 
ADD CONSTRAINT chk_stars CHECK (stars BETWEEN 1 AND 5);

-- Definir longitud mínima para el código postal en Addresses
ALTER TABLE Addresses 
MODIFY postal_code VARCHAR(10) CHECK (LENGTH(postal_code) >= 5);


-- ========================================
-- INDICES 
-- ========================================

-- Índice en el campo id_city en la tabla Hotels para optimizar joins
CREATE INDEX idx_hotel_id_city ON Hotels(id_city);

-- Índice en el campo id_toi en la tabla Visitors_Comments para optimizar joins y búsquedas
CREATE INDEX idx_comment_id_toi ON Visitors_Comments(id_toi);

