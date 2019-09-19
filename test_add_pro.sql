--The report procedure served as a test
--report to test the add_book procedure

DECLARE
    isbn_10_in NUMBER(10) := 1111111111;
    title_in VARCHAR2(200) := 'Testing the proce';
    author_in VARCHAR2(200) := 'Ari';
    published_date_in DATE := TO_DATE('19-SEP-2019','DD-MM-YYYY');   
    total_pages_in NUMBER := 1; 

    CURSOR bookcountCur IS 
        SELECT COUNT(*) FROM books;
    
    books_count NUMBER;
       
BEGIN
    DELETE books;

    --add a book using add_book.pro
    add_book(isbn_10_in,title_in,author_in, published_date_in, total_pages_in);

	-- assign the value of the cursor to books_count
    OPEN bookcountCur;
    FETCH bookcountCur INTO books_count;
	
	--test report.pro	
    report('Check the total of books: ', expected_value => '1', actual_value => books_count);
    CLOSE bookcountCur;
   
END;
