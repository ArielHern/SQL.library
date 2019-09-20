
--Make changes to a book 
CREATE OR REPLACE PROCEDURE update_book(
isbn_10_in IN NUMBER,
new_title IN VARCHAR2,
new_author IN VARCHAR2,
new_published_date IN DATE,
new_total_pages IN NUMBER)
AS
BEGIN
    --check for isbn
    IF isbn_10_in IS NULL
    THEN
    RAISE VALUE_ERROR;
    END IF;
    
    UPDATE books
		SET title = new_title, author = new_author, published_date = new_published_date, total_pages = new_total_pages; 
    WHERE isbn_10 = isbn_10_in
	IF SQL%ROWCOUNT=0
	THEN
		RAISE NO_DATA_FOUND;
	END IF;
    
END update_book   
;
