

--add a new book 
CREATE OR REPLACE PROCEDURE add_book(
isbn_10_in IN NUMBER,
title_in IN VARCHAR2,
author_in IN VARCHAR2,
published_date_in IN DATE,
total_pages_in IN NUMBER)
AS
BEGIN
    --check for isbn
    IF isbn_10_in IS NULL
    THEN
    RAISE VALUE_ERROR;
    END IF;
    
    INSERT INTO books(isbn_10, title, author, published_date,total_pages)
    VALUES(isbn_10_in, title_in, author_in,published_date_in,total_pages_in);
    
END add_book   
;
