CREATE OR REPLACE PROCEDURE get_uppercase_text_proc  (
source_text IN USELESS_CONFIG_TABLE.VALORE%type,
output_text OUT MYTEST.ADDITIONAL_DESC%type,
err_text OUT NUMBER) AS
BEGIN
   DBMS_OUTPUT.put_line(UPPER(source_text));
   output_text:= UPPER(source_text);
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       err_text := 1;
     WHEN OTHERS THEN
       err_text := 2;
       RAISE;
END get_uppercase_text_proc;
/
