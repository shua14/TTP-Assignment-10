-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
-- Create the new database if it does not exist already

CREATE TABLE book   
(
    ISBN_Id varchar(255) not NULL,
    Year INTEGER,
    Title varchar(255),
    Price NUMERIC(19,0),
);

insert into book values( 12345, 2001, 'book1', 12),
(123456, 2002, 'book2', 14)


CREATE TABLE Author   
(
    ISBN_Id varchar(255) not NULL,
    Author_Name  varchar(255),
    Author_Address varchar(255),
    Birth_Year INTEGER
);

insert into Author values( 12345, 'Tom', '123 address', 1890),
(123456, 'Mike', '123 address', 1880)



CREATE TABLE Publisher   
(
    ISBN_Id varchar(255) not NULL,
    Publisher_Name  varchar(255),
    Publisher_Address varchar(255),
    Phone INTEGER
);


insert into Publisher values( 12345, 'Nike', '123 address', 347000),
(123456, 'Peter', '123 address', 18111)


CREATE TABLE ShoppingBasket_Book  
(   
    ShoppingBasket_ID varchar(255) not NULL,
    ISBN_Id varchar(255) not NULL,
    Email varchar(255),
    count INTEGER,
);


insert into ShoppingBasket_Book values(1 , 12345, '1321@gmail.com', 20),
(2, 123456, '123@gmial.com', 10)




SELECT book.ISBN_Id, Author.Author_Name, Publisher.Publisher_Name
FROM ((book
INNER JOIN Author ON book.ISBN_Id = Author.ISBN_Id)
INNER JOIN Publisher ON book.ISBN_Id = Publisher.ISBN_Id);

SELECT book.ISBN_Id, Author.Author_Name, Publisher.Publisher_Name, ShoppingBasket_Book.count
FROM (((book
INNER JOIN Author ON book.ISBN_Id = Author.ISBN_Id)
INNER JOIN Publisher ON book.ISBN_Id = Publisher.ISBN_Id)
INNER JOIN ShoppingBasket_Book ON book.ISBN_Id = ShoppingBasket_Book.ISBN_Id);

