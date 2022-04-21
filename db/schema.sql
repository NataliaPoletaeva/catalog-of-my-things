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
  CONSTRAINT fk_Labels  
  FOREIGN KEY(label_id) REFERENCES labels(id)
);

-- create labels table
CREATE TABLE labels (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title varchar(100),
  color varchar(100)
);
