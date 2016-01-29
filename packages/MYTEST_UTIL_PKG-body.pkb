CREATE OR REPLACE PACKAGE BODY MYTEST_UTIL_PKG AS

--this function will raise an exception ZERO_DIVIDE and must be catched outside
  FUNCTION USELESS_FUNCT(num IN NUMBER) RETURN NUMBER IS
  division NUMBER;
  BEGIN
    division := num/0;
    RETURN division;
  END;

--this procedure will raise a custom exception CUSTOM_EXCEPTION and must be catched outside
  PROCEDURE USELESS_PROC(num IN NUMBER) IS
  division NUMBER;
  BEGIN
    division := num/0;
    EXCEPTION 
        WHEN ZERO_DIVIDE THEN
            dbms_output.put_line(' raising a custom exception' );    
            RAISE MYTEST_UTIL_PKG.CUSTOM_EXCEPTION;
  END;

END MYTEST_UTIL_PKG;
/
