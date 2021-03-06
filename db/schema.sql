-- create database
CREATE DATABASE catalog_of_my_things;

-- create labels table
CREATE TABLE labels (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title varchar(100),
  color varchar(100)
);

-- create authors table 
CREATE TABLE authors (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name varchar(100),
  last_name varchar(100)
);

-- add schema for music and genres
CREATE TABLE genres (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50) NOT NULL
);

-- create books table
CREATE TABLE books (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher varchar(200),
  publish_date date,
  cover_state varchar(50),
  archived boolean,
  label_id integer NOT NULL,
  author_id integer NOT NULL,
  genre_id integer NOT NULL,
  CONSTRAINT fk_Labels
  FOREIGN KEY(label_id) REFERENCES labels(id),
  CONSTRAINT fk_Authors
  FOREIGN KEY(author_id) REFERENCES authors(id),
  CONSTRAINT fk_Genres
  FOREIGN KEY(genres_id) REFERENCES genres(id)
);

-- create games table
CREATE TABLE games (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  multiplayer boolean,
  last_played_date date,
  publish_date date,
  archived boolean,
  label_id integer NOT NULL,
  author_id integer NOT NULL,
  genre_id integer NOT NULL,
  CONSTRAINT fk_Labels
  FOREIGN KEY(label_id) REFERENCES labels(id)
  CONSTRAINT fk_Authors
  FOREIGN KEY(author_id) REFERENCES authors(id),
  CONSTRAINT fk_Genres
  FOREIGN KEY(genres_id) REFERENCES genres(id),
);

-- create music_albums table
CREATE TABLE music_albums (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  on_spotify BOOLEAN NOT NULL,
  label_id integer NOT NULL,
  author_id integer NOT NULL,
  genre_id integer NOT NULL,
  CONSTRAINT fk_Labels
  FOREIGN KEY(label_id) REFERENCES labels(id),
  CONSTRAINT fk_Authors
  FOREIGN KEY(author_id) REFERENCES authors(id),
  CONSTRAINT fk_Genres
  FOREIGN KEY(genres_id) REFERENCES genres(id)
);

CREATE INDEX books_label_id ON books(label_id);
CREATE INDEX books_author_id ON books(author_id);
CREATE INDEX books_genre_id ON books(genre_id);

CREATE INDEX games_label_id ON games(label_id);
CREATE INDEX games_author_id ON games(author_id);
CREATE INDEX games_genre_id ON games(genre_id);

CREATE INDEX musicalbums_label_id ON musicalbums(label_id);
CREATE INDEX musicalbums_author_id ON musicalbums(author_id);
CREATE INDEX musicalbums_genre_id ON musicalbums(genre_id);
