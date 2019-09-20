--The report procedure served as a test
--report to test the add_book procedure

DECLARE
	--local variable for testting
    l_isbn_10 NUMBER(10) := 1111111111;
    l_title VARCHAR2(200) := 'Testing the proce';
    l_author VARCHAR2(200) := 'Ari';
    l_published_date DATE := TO_DATE('19-SEP-2019','DD-MM-YYYY');   
    l_total_pages NUMBER := 1; 
	
	l_title_update VARCHAR2(200) := 'Title updated';

    CURSOR bookcountCur IS 
        SELECT COUNT(*) FROM books;
    
    
	books_count NUMBER;
	l_sqlcode NUMBER;
	
	
       
BEGIN
    DELETE books;

    --add a book using add_book.pro
    add_book(l_isbn_10,l_title,l_author, l_published_date, l_total_pages);

	-- assign the value of the cursor to books_count
    OPEN bookcountCur;
    FETCH bookcountCur INTO books_count;
	
	--test report.pro	
    report('Procedure add_books: ', expected_value => '1', actual_value => books_count);
    CLOSE bookcountCur;
	
	--duplicate
	BEGIN
		add_book(l_isbn_10,l_title,l_author, l_published_date, l_total_pages);
		l_sqlcode := SQLCODE;
	EXCEPTION
		WHEN OTHERS THEN
			l_sqlcode := SQLCODE;
	END;
	report('Detention of duplicate ISBN number : ', expected_value => '-1', actual_value => l_sqlcode);
	
	--update book
	BEGIN
		update_book(1111111111,l_title_update,'Ari',TO_DATE('19-SEP-2019', 'DD-MM-YYYY'), 1);
	END;
	report('Procedure update_book: ', expected_value=>'Title updated', actual_value=>l_title_update);
	
	
	
   
END;
