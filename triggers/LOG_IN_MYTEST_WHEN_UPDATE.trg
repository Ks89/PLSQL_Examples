DROP TRIGGER LOG_IN_MYTEST_WHEN_UPDATE;

CREATE OR REPLACE TRIGGER LOG_IN_MYTEST_WHEN_UPDATE
BEFORE UPDATE
OF VALORE
ON USELESS_CONFIG_TABLE 
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
WHEN (
OLD.parametro='update'
      )
DECLARE
current_time VARCHAR2(100);
returned VARCHAR2(100);
out_value VARCHAR2(100);
err_value VARCHAR2(100);

BEGIN

    current_time := TO_CHAR (SYSDATE,  'Day, DDth Month YYYY HH24:MI:SS');
     DBMS_OUTPUT.put_line(current_time);
                  
    UPPER_CASE_PKG.get_uppercase_text_proc(:OLD.VALORE, out_value, err_value);
    DBMS_OUTPUT.put_line(out_value);
   
    IF err_value = 1 OR err_value = 2 THEN
        out_value := 'There is an error. Previous text: ' || :OLD.VALORE;
    END IF;
     
    --Working example of a call to a function into a package 
    --returned := UPPER_CASE_PKG.get_uppercase_tex(:NEW.VALORE);
    --DBMS_OUTPUT.put_line(returned);             
    
     INSERT INTO MYTEST      
        (ID_SEQ, TEST, DESCRIPTION, ADDITIONAL_DESC)
        values(MYTEST_SEQ.nextval, :OLD.GRUPPO || current_time , :OLD.PARAMETRO, out_value || ' UPDATED' );

    EXCEPTION
        WHEN OTHERS THEN           
         DBMS_OUTPUT.put_line('oh! there is an error!!!!');
       -- Consider logging the error and then re-raise
        RAISE;

END LOG_IN_MYTEST_WHEN_UPDATE;
/
