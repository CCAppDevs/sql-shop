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
INSERT INTO genres (name) VALUES
('Action'),
('Adventure'),
('Role-Playing'),
('Simulation'),
('Strategy'),
('Sports'),
('Puzzle');

INSERT INTO games (
    name,
    platform,
    release_date,
    description,
    developer,
    publisher,
    image,
    features
) VALUES
('World of Warcraft: Forever', 'PC', '2026-10-04', 'Massive Multiplayer RPG with 25 years of history', 'Blizzard Entertainment', 'Blizzard Entertainment', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX574KH-MCoUr9ECT-Ls-j8ahsKmBhdFOFPDmBIb1eGw&s=10', 'Multiplayer, Online, Fantasy, Open World, PVP'),
('The Legend of Zelda: Tears of the Kingdom', 'Nintendo Switch', '2023-05-12', 'The Legend of Zelda: Tears of the Kingdom is an action-adventure game developed and published by Nintendo for the Nintendo Switch.', 'Nintendo EPD', 'Nintendo', 'https://upload.wikimedia.org/wikipedia/en/0/0b/The_Legend_of_Zelda_Tears_of_the_Kingdom.jpg', 'Action, Adventure, Open World, Fantasy, Exploration'),
('Elden Ring', 'PC, PS4, PS5, Xbox One, Xbox Series X/S', '2022-02-25', 'Elden Ring is an action role-playing game developed by FromSoftware and published by Bandai Namco Entertainment. It is directed by Hidetaka Miyazaki with worldbuilding provided by fantasy writer George R. R. Martin.', 'FromSoftware', 'Bandai Namco Entertainment', 'https://upload.wikimedia.org/wikipedia/en/8/8e/Elden_Ring_cover_art.jpg', 'Action RPG, Open World, Fantasy, Exploration, Combat');

-- INSERT INTO game_genres (game_id, genre_id) VALUES
-- (),
-- ();


-- TEST THIS DATABASE
SELECT * FROM genres;
SELECT * FROM game_genres;
SELECT * FROM games;

