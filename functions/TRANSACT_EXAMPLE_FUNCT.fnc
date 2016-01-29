CREATE OR REPLACE FUNCTION TRANSACT_EXAMPLE_FUNCT RETURN INTEGER IS
    err_code INTEGER;  

--this is a function declared here a variable, visiible only inside
--this function
FUNCTION get_random (
    from_num IN INTEGER,
    to_num IN INTEGER
  ) RETURN INTEGER
  IS
   result INTEGER;
  BEGIN
    result := dbms_random.value(from_num,to_num);
    RETURN result;
  END get_random;

-- begin of TRANSACT_EXAMPLE_FUNCT function.
BEGIN
   err_code := 0;
                                        
   --useless, only to test a call to a "private" function
   DBMS_OUTPUT.PUT_LINE(get_random(5,12));
                                       
   --division with correct input params
   TRY_TO_INSERT_FAILING(5,1,err_code);
                                                                               
   IF err_code = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Operation completed correctly, as expected.');      
   ELSIF err_code = 1 THEN
    DBMS_OUTPUT.PUT_LINE('Operation completed with errors - > Rollbacking.');        
    ROLLBACK;
    RETURN 1;
   END IF;
       
   --division with wrong input params
   TRY_TO_INSERT_FAILING(5,0,err_code);
  

    CASE err_code
        WHEN 0 THEN 
            DBMS_OUTPUT.PUT_LINE('Operation completed correctly (unexpected, please check the code)');
        WHEN 1 THEN 
            DBMS_OUTPUT.PUT_LINE('Operation completed with errors (as expected, everything is ok) - > Rollbacking');
            ROLLBACK;
            RETURN 1;
        ELSE NULL;
     END CASE;


   RETURN 0;
   
   EXCEPTION
     WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('Operation completed with errors catching an unexpected exception (check the code) - > Rollbacking');        
       ROLLBACK;
       RETURN 1;

END TRANSACT_EXAMPLE_FUNCT;
/
