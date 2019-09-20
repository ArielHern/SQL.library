
--Delete a book 
CREATE OR REPLACE PROCEDURE delete_book(
isbn_10_in IN NUMBER)
AS
BEGIN
    --check for isbn
    IF isbn_10_in IS NULL
    THEN
    RAISE VALUE_ERROR;
    END IF;
    
    DELETE FROM books
	WHERE isbn_10 = isbn_10_in;
    
END delete_book   
;
