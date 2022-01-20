CREATE DATABASE book_database;

--\c into book_database
CREATE TABLE book(
    isbn_id SERIAL PRIMARY KEY,
    title varchar(255),
    year INTEGER,
    price INTEGER
);