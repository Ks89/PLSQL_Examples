CREATE OR REPLACE PACKAGE MYTEST_UTIL_PKG AS

 CUSTOM_EXCEPTION EXCEPTION;

  FUNCTION USELESS_FUNCT(num IN NUMBER) RETURN NUMBER;
  PROCEDURE USELESS_PROC(num IN NUMBER);

END MYTEST_UTIL_PKG;
/
