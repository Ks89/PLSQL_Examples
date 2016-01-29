CREATE OR REPLACE PROCEDURE use_example_cursor(
utente_row IN USER_USELESS_TABLE%rowtype,
gruppo  IN MYTEST.TEST%type,
parametro IN MYTEST.DESCRIPTION%type,
valore IN MYTEST.ADDITIONAL_DESC%type) AS

division NUMBER;
BEGIN
    dbms_output.put_line('begin procedure cursor example' );
          
    --useless block only to try to catch an exception inside a BEGIN-END without 
    --blocking the entire procedure
    BEGIN
        division := 5/0;
        EXCEPTION 
            WHEN ZERO_DIVIDE THEN
                dbms_output.put_line('begin procedure cursor example' );
    END;
    
    INSERT INTO MYTEST      
         (ID_SEQ, TEST, DESCRIPTION, ADDITIONAL_DESC)
        values(MYTEST_SEQ.nextval, gruppo , parametro, get_uppercase_text(valore) || 
            ' INSERTED and username is: '  || utente_row.username  || ' and ' || utente_row.pwd );
            
END use_example_cursor;
/
