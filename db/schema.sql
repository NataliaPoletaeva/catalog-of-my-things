-- create database
CREATE DATABASE catalog_of_my_things;

-- create books table
CREATE TABLE books (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher varchar(200),
  publish_date date,
  cover_state varchar(50),
  archived boolean,
  label_id integer NOT NULL,
  author_id integer NOT NULL,
  CONSTRAINT fk_Labels
  CONSTRAINT fk_Authors 
  FOREIGN KEY(label_id) REFERENCES labels(id)
  FOREIGN KEY(author_id) REFERENCES authors(id)
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
  CONSTRAINT fk_Labels
  CONSTRAINT fk_Authors
  FOREIGN KEY(label_id) REFERENCES labels(id)
  FOREIGN KEY(author_id) REFERENCES authors(id)
);

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

CREATE TABLE music_albums (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    on_spotify BOOLEAN NOT NULL,
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);
