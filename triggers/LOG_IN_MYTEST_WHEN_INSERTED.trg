DROP TRIGGER LOG_IN_MYTEST_WHEN_INSERTED;

CREATE OR REPLACE TRIGGER LOG_IN_MYTEST_WHEN_INSERTED
BEFORE INSERT
ON USELESS_CONFIG_TABLE 
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
current_time VARCHAR2(100);
tempvalue VARCHAR2(100);
prev_row_count INTEGER;

CURSOR c1 is
          SELECT * FROM  USERS_TABLE
          WHERE ID_UTENTE < 100;

CURSOR c2 is
          SELECT * FROM  MYTEST  
          FOR UPDATE OF ADDITIONAL_DESC;
          
BEGIN

     current_time := TO_CHAR (SYSDATE, 'Day, DDth Month YYYY HH24:MI:SS');
     DBMS_OUTPUT.put_line(current_time);
      
    --here i want to try to call a private function into a package, obviously I can't -> The trigger won't compile!             
    --tempvalue := UPPER_CASE_PKG.private_function('i am trying to call a private funct');
                       
    --use_example_cursor('dasdasd');
     
    DBMS_OUTPUT.put_line('begin procedure cursor example' );    
          
    FOR ccc IN c1 LOOP
        DBMS_OUTPUT.put_line(ccc.USERNAME);            
        use_example_cursor(ccc, :NEW.GRUPPO || current_time , :NEW.PARAMETRO,  :NEW.VALORE );
        --INSERT INTO MYTEST      
        -- (ID_SEQ, TEST, DESCRIPTION, ADDITIONAL_DESC)
        -- values(MYTEST_SEQ.nextval, :NEW.GRUPPO || current_time , :NEW.PARAMETRO, get_uppercase_text(:NEW.VALORE) || 'INSERTED with username ' || ccc.USERNAME  );
    END LOOP;     
    
    
      FOR xxx IN c2 LOOP
        DBMS_OUTPUT.put_line(xxx.ADDITIONAL_DESC);            
        
       UPDATE MYTEST                       
         SET ADDITIONAL_DESC = LOWER(xxx.ADDITIONAL_DESC)
         WHERE ID_SEQ = xxx.ID_SEQ AND xxx.DESCRIPTION != :NEW.PARAMETRO;
        
    END LOOP;


    EXCEPTION
        WHEN OTHERS THEN           
         DBMS_OUTPUT.put_line('oh! there is an error!!!!');
       -- Consider logging the error and then re-raise
        RAISE;
END;
/
