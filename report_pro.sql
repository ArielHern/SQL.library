

/*
compare two values and print out a "pass" message if they're the same
and "fail" if they differ
*/
CREATE OR REPLACE PROCEDURE report(
	test_title IN VARCHAR2,
	expected_value IN VARCHAR2,
	actual_value IN VARCHAR2)
AS 
BEGIN 
	DBMS_OUTPUT.PUT(test_title || ': ');
	IF expected_value = actual_value
	OR (expected_value IS NULL AND actual_value IS NULL)
	THEN 
		DBMS_OUTPUT.PUT('PASSED');
	ELSE
		DBMS_OUTPUT.PUT('FAILED. Expected: ' || expected_value || 'got '|| actual_value);
	END IF;
END test_report  
;
