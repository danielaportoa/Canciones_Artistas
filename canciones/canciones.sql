CREATE DATABASE canciones_db;

USE canciones_db;

INSERT INTO canciones (titulo, artista, album, genero, idioma) 
VALUES 
('Bohemian Rhapsody', 'Queen', 'A Night at the Opera', 'Rock', 'Inglés'),
('Clocks', 'Coldplay', 'A Rush of Blood to the Head', 'Alternativo', 'Inglés'),
('Tren al Sur', 'Los Prisioneros', 'Corazones', 'Rock Latino', 'Español'),
('Get Lucky', 'Daft Punk', 'Random Access Memories', 'Disco / Pop', 'Inglés'),
('De Música Ligera', 'Soda Stereo', 'Canción Animal', 'Rock en Español', 'Español'),
('Billie Jean', 'Michael Jackson', 'Thriller', 'Pop', 'Inglés'),
('Shape of You', 'Ed Sheeran', '÷ (Divide)', 'Pop', 'Inglés');

-- Consulta rápida para verificar que se guardaron correctamente:
SELECT * FROM canciones;

UPDATE canciones 
SET created_at = NOW() 
WHERE created_at IS NULL;

SELECT id, titulo, created_at FROM canciones;