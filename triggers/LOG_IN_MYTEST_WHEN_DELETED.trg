DROP TRIGGER LOG_IN_MYTEST_WHEN_DELETED;

CREATE OR REPLACE TRIGGER LOG_IN_MYTEST_WHEN_DELETED
BEFORE DELETE
ON USELESS_CONFIG_TABLE 
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
current_time VARCHAR2(100);
out_value VARCHAR2(100);
err_value VARCHAR2(100);
retval NUMBER;

BEGIN
    
     current_time := TO_CHAR (SYSDATE, 'Day, DDth Month YYYY HH24:MI:SS');
     
     DBMS_OUTPUT.put_line(current_time);
   
    get_uppercase_text_proc(:OLD.VALORE, out_value, err_value);
    DBMS_OUTPUT.put_line(out_value);
   
    IF err_value = 1 OR err_value = 2 THEN
        out_value := 'There was an error. Previous text: ' || :OLD.VALORE;
    END IF;
              
    --example of procedure's call catching a custom exeption                 
    BEGIN            
        MYTEST_UTIL_PKG.USELESS_PROC(5);                                                                         
        EXCEPTION
            WHEN MYTEST_UTIL_PKG.CUSTOM_EXCEPTION THEN
                DBMS_OUTPUT.put_line('Catched my CUSTOM_EXCEPTION correctly');       
            WHEN OTHERS THEN       
                DBMS_OUTPUT.put_line(' CUSTOM_EXCEPTION not catched correctly, there was an error, please check!!!!');       
    END;                                                                                       
    
    --example of function's call catching the oracle exception (ZERO_DIVION)
    BEGIN            
        retval := MYTEST_UTIL_PKG.USELESS_FUNCT(5);                                                            
        EXCEPTION
            WHEN ZERO_DIVIDE THEN
                DBMS_OUTPUT.put_line('Catched a zero divide correctly');        
            WHEN OTHERS THEN       
                DBMS_OUTPUT.put_line(' ZERO_DIVIDE not catched correctly, there was an error, please check!!!!');
    END; 
    
     
     INSERT INTO MYTEST      
        (ID_SEQ, TEST, DESCRIPTION, ADDITIONAL_DESC)
        values(MYTEST_SEQ.nextval, :OLD.GRUPPO || current_time , :OLD.PARAMETRO, out_value || 'DELETED');

   EXCEPTION
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END LOG_IN_MYTEST_WHEN_DELETED;
/
