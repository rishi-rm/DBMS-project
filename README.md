Music Playlist Organizer
Description
The Music Playlist Organizer is a database management system (DBMS) project designed to manage music playlists, users, songs, genres, and artists. It allows users to create playlists, add songs to them, and organize their music collection efficiently. The system is built using MySQL to manage the data, with tables for users, artists, songs, genres, playlists, and the relationships between them.

This project features a relational database schema with entities like Users, Artists, Songs, Playlists, and Genres, as well as the relationships between them. The project covers SQL queries, ER diagram, and provides sample data for better demonstration and understanding.

Features
Users: Create accounts, add playlists, and manage music collections.

Artists: Store information about various music artists and their songs.

Genres: Categorize songs into various genres (e.g., Pop, Rap, Indie).

Songs: Store details about songs, such as title, duration, release year, artist, and genre.

Playlists: Users can create, view, and modify playlists with songs from various genres and artists.

Technologies Used
Database: MySQL

SQL: Used for writing queries to interact with the database

ER Diagram: Visual representation of the database schema

GitHub: Used for version control and project management

Database Schema
Tables
Users: Stores information about users.

Artists: Stores information about music artists.

Genres: Stores information about music genres.

Songs: Stores information about individual songs, including which artist and genre they belong to.

Playlists: Stores information about user-created playlists.

Playlist_Songs: A many-to-many relationship table that links playlists and songs.

Relationships
A User creates one or more Playlists.

A Playlist can contain many Songs.

A Song is created by an Artist and belongs to a Genre.

A Playlist can have many Songs through the Playlist_Songs table.

Set up MySQL:

Make sure MySQL is installed on your system.

Create a database and import the provided SQL file:

sql
Copy
Edit
CREATE DATABASE music_playlist_organizer;
USE music_playlist_organizer;
SOURCE schema.sql;
Insert Sample Data:

After setting up the schema, run the insert statements to populate the tables with sample data.

Example:

sql
Copy
Edit
INSERT INTO Artists (artist_name, country) VALUES ('Playboi Carti', 'USA'), ('A$AP Rocky', 'USA');
Run Queries:

You can now run the queries provided in the queries.sql file or create your own to interact with the database.

Sample Queries
Here are some example queries you can run:

Retrieve all users:

sql
Copy
Edit
SELECT * FROM Users;
List all songs with their corresponding artist and genre:

sql
Copy
Edit
SELECT s.song_title, a.artist_name, g.genre_name
FROM Songs s
JOIN Artists a ON s.artist_id = a.artist_id
JOIN Genres g ON s.genre_id = g.genre_id;
Find the total number of songs in the database:

sql
Copy
Edit
SELECT COUNT(*) AS total_songs FROM Songs;
ER Diagram
The ER diagram visualizes the relationships between entities in the database. You can view it here.

Example Output
Here’s an example output from a query:

Query: List all songs with their artist and genre:

sql
Copy
Edit
SELECT s.song_title, a.artist_name, g.genre_name
FROM Songs s
JOIN Artists a ON s.artist_id = a.artist_id
JOIN Genres g ON s.genre_id = g.genre_id;
Output:

Song Title	Artist Name	Genre Name
Sky	Playboi Carti	Rap
LSD	A$AP Rocky	Rap
The Less I Know the Better	Tame Impala	Indie
