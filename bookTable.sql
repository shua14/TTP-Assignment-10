-- Create a new database called 'DatabaseName'
CREATE DATABASE postgres_book;


-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
DROP TABLE IF EXISTS book;

-- Create the table in the specified schema
CREATE TABLE book   
(
    ISBN_Id varchar(255) not NULL PRIMARY KEY,
    Year INTEGER,
    Title varchar(255),
    Price NUMERIC(19,0)
);

insert into book values( 12345, 2001, 'book1', 12),
(123456, 2002, 'book2', 14)


DROP TABLE IF EXISTS Author;

CREATE TABLE Author   
(
    ISBN_Id varchar(255) not NULL,
    Author_Name  varchar(255) PRIMARY KEY,
    Author_Address varchar(255),
    Birth_Year INTEGER,
    FOREIGN KEY (ISBN_Id) REFERENCES book(ISBN_Id)
);

insert into Author values( 12345, 'Tom', '123 address', 1890),
(123456, 'Mike', '123 address', 1880)

SELECT e.ISBN_Id, e.Author_Name, e.Author_Address, e.Birth_Year
FROM Author as e

DROP TABLE IF EXISTS PUblisher;

CREATE TABLE Publisher   
(
    ISBN_Id varchar(255) not NULL,
    Publisher_Name  varchar(255) PRIMARY KEY,
    Publisher_Address varchar(255),
    Phone INTEGER,
    FOREIGN KEY (ISBN_Id) REFERENCES book(ISBN_Id)

);

insert into Publisher values( 12345, 'Nike', '123 address', 347000),
(123456, 'Peter', '123 address', 18111)

SELECT e.ISBN_Id, e.Publisher_Name, e.Publisher_Address, e.Phone
FROM Publisher as e

DROP TABLE IF EXISTS ShoppingBasket_Book;

CREATE TABLE ShoppingBasket_Book  
(   
    ShoppingBasket_ID varchar(255) not NULL PRIMARY KEY,
    ISBN_Id varchar(255) not NULL,
    Email varchar(255),
    count INTEGER,
    FOREIGN KEY (ISBN_Id) REFERENCES book(ISBN_Id)
);

insert into ShoppingBasket_Book values(1 , 12345, '1321@gmail.com', 20),
(2, 123456, '123@gmail.com', 10)

SELECT e.ShoppingBasket_ID, e.ISBN_Id, e.Email, e.count
FROM ShoppingBasket_Book as e

--inner join three table 
SELECT book.ISBN_Id, Author.Author_Name, Publisher.Publisher_Name
FROM ((book
INNER JOIN Author ON book.ISBN_Id = Author.ISBN_Id)
INNER JOIN Publisher ON book.ISBN_Id = Publisher.ISBN_Id);

--inner join four table
SELECT book.ISBN_Id, Author.Author_Name, Publisher.Publisher_Name, ShoppingBasket_Book.count
FROM (((book
INNER JOIN Author ON book.ISBN_Id = Author.ISBN_Id)
INNER JOIN Publisher ON book.ISBN_Id = Publisher.ISBN_Id)
INNER JOIN ShoppingBasket_Book ON book.ISBN_Id = ShoppingBasket_Book.ISBN_Id);



