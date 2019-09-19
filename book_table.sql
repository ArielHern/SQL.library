
--create a title to house the books
CREATE TABLE book(
isbn_10 NUMBER(10),
title VARCHAR2(100),
author VARCHAR2(100),
published_date DATE,
total_pages NUMBER,
CONSTRAINT isbn_nums CHECK (isbn_10 > 999999999 AND isbn_10 <= 9999999999)
);
