create database playlistOrganizer;
use playlistOrganizer;
-- USERS
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    join_date DATE
);

-- ARTISTS
CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- GENRES
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

-- SONGS
CREATE TABLE Songs (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    song_title VARCHAR(100) NOT NULL,
    artist_id INT,
    genre_id INT,
    duration INT, -- in seconds
    release_year YEAR,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- PLAYLISTS
CREATE TABLE Playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- PLAYLIST_SONGS (Many-to-Many)
CREATE TABLE Playlist_Songs (
    playlist_id INT,
    song_id INT,
    added_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (playlist_id, song_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

-- USERS (15)
INSERT INTO Users (username, email) VALUES
('rishabh', 'rishabh@email.com'),
('luna', 'luna@email.com'),
('avi', 'avi@email.com'),
('megha', 'megha@email.com'),
('zayn', 'zayn@email.com'),
('tina', 'tina@email.com'),
('alex', 'alex@email.com'),
('rohan', 'rohan@email.com'),
('alina', 'alina@email.com'),
('neha', 'neha@email.com'),
('danny', 'danny@email.com'),
('sara', 'sara@email.com'),
('jatin', 'jatin@email.com'),
('mira', 'mira@email.com'),
('tommy', 'tommy@email.com');

-- ARTISTS (15)
INSERT INTO Artists (artist_name, country) VALUES
('Playboi Carti', 'USA'),
('A$AP Rocky', 'USA'),
('Tame Impala', 'Australia'),
('OneRepublic', 'USA'),
('Travis Scott', 'USA'),
('Drake', 'Canada'),
('Yeat', 'USA'),
('Juice WRLD', 'USA'),
('Lil Uzi Vert', 'USA'),
('Kanye West', 'USA'),
('21 Savage', 'UK'),
('Metro Boomin', 'USA'),
('Brent Faiyaz', 'USA'),
('Frank Ocean', 'USA'),
('The Kid LAROI', 'Australia');

-- GENRES (7)
INSERT INTO Genres (genre_name) VALUES
('Pop'),
('Rock'),
('Indie'),
('Bollywood'),
('EDM'),
('Rap'),
('R&B');

-- SONGS (15) → Match artist_id and genre_id accordingly
INSERT INTO Songs (song_title, artist_id, genre_id, duration, release_year) VALUES
('Sky', 1, 6, 158, 2020),
('LSD', 2, 6, 245, 2015),
('The Less I Know The Better', 3, 3, 216, 2015),
('Counting Stars', 4, 1, 257, 2013),
('Goosebumps', 5, 6, 244, 2016),
('God\'s Plan', 6, 6, 198, 2018),
('Rich Minion', 7, 6, 122, 2022),
('Lucid Dreams', 8, 6, 239, 2018),
('XO TOUR Llif3', 9, 6, 223, 2017),
('Praise God', 10, 6, 222, 2021),
('a lot', 11, 6, 276, 2018),
('Creepin\'', 12, 6, 214, 2022),
('Dead Man Walking', 13, 7, 241, 2020),
('Nights', 14, 7, 307, 2016),
('Stay', 15, 1, 141, 2021);

-- PLAYLISTS (15)
INSERT INTO Playlists (user_id, playlist_name) VALUES
(1, 'Workout Vibes'),
(2, 'Late Night Chill'),
(3, 'Love Songs'),
(4, 'Party Mix'),
(5, 'Focus Zone'),
(6, 'Throwback'),
(7, 'Morning Boost'),
(8, 'Rainy Day'),
(9, 'Trap Zone'),
(10, 'Indie Feels'),
(11, 'Rap Gods'),
(12, 'R&B Soul'),
(13, 'Feel Good'),
(14, 'Study Time'),
(15, 'Main Character Energy');

-- PLAYLIST_SONGS (15)
INSERT INTO Playlist_Songs (playlist_id, song_id) VALUES
(1, 1),    -- Sky
(2, 14),   -- Nights
(3, 4),    -- Counting Stars
(4, 5),    -- Goosebumps
(5, 7),    -- Rich Minion
(6, 2),    -- LSD
(7, 6),    -- God's Plan
(8, 13),   -- Dead Man Walking
(9, 10),   -- Praise God
(10, 3),   -- The Less I Know The Better
(11, 11),  -- a lot
(12, 12),  -- Creepin'
(13, 8),   -- Lucid Dreams
(14, 15),  -- Stay
(15, 9);   -- XO TOUR Llif3

select * from Playlist_songs;

SELECT username, email
FROM Users;

SELECT s.song_title, a.artist_name, g.genre_name
FROM Songs s
JOIN Artists a ON s.artist_id = a.artist_id
JOIN Genres g ON s.genre_id = g.genre_id;

SELECT COUNT(*) AS total_songs
FROM Songs;

SELECT p.playlist_name, u.username
FROM Playlists p
JOIN Users u ON p.user_id = u.user_id;

SELECT s.song_title
FROM Songs s
JOIN Genres g ON s.genre_id = g.genre_id
WHERE g.genre_name = 'Rap';

INSERT INTO Songs (song_title, artist_id, genre_id, duration, release_year)
VALUES ('Crush', 1, 6, 200, 2025);

UPDATE Songs
SET genre_id = 7
WHERE song_id = 3;

DELETE FROM Songs
WHERE song_id = 15;

SELECT p.playlist_name
FROM Playlists p
JOIN Playlist_Songs ps ON p.playlist_id = ps.playlist_id
JOIN Songs s ON ps.song_id = s.song_id
WHERE s.song_title = 'XO TOUR Llif3';

SELECT s.song_title
FROM Songs s
JOIN Artists a ON s.artist_id = a.artist_id
WHERE a.artist_name = 'Drake';

SELECT AVG(duration) AS avg_duration
FROM Songs s
JOIN Genres g ON s.genre_id = g.genre_id
WHERE g.genre_name = 'Pop';

SELECT s.song_title, a.artist_name, s.duration
FROM Songs s
JOIN Artists a ON s.artist_id = a.artist_id
ORDER BY s.duration DESC;


SELECT g.genre_name, COUNT(s.song_id) AS song_count
FROM Genres g
JOIN Songs s ON g.genre_id = s.genre_id
GROUP BY g.genre_name;





