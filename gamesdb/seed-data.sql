-- drop all tables if they exist
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS game_genres;
DROP TABLE IF EXISTS genres;

-- create tables

-- VIDEO GAMES: names, system, release date, genre, description, developer
-- publisher, image, features

CREATE TABLE games (
    id INTEGER PRIMARY KEY, -- auto incremented primary identifier
    name TEXT NOT NULL, -- name of the game
    platform TEXT NOT NULL, -- platform the game is on (many relationship)
    release_date TEXT, -- release date of the game
    description TEXT NOT NULL, -- description of the game
    developer TEXT NOT NULL, -- developer of the game
    publisher TEXT, -- publisher of the game
    image TEXT, -- image of the game
    features TEXT NOT NULL -- features of the game (MANY)
);

-- link it up (bridge the two tables)
CREATE TABLE game_genres (
    game_genre_id INTEGER PRIMARY KEY,
    game_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    FOREIGN KEY (game_id) REFERENCES games(id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE genres (
    genre_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- insert seed data

-- TEST THIS DATABASE
SELECT * FROM games;