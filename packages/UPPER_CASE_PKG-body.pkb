CREATE OR REPLACE PACKAGE BODY UPPER_CASE_PKG AS


FUNCTION get_uppercase_tex (source_text in varchar2) return varchar2 is
BEGIN
   DBMS_OUTPUT.put_line(UPPER(source_text));
   RETURN UPPER(source_text);
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END;


PROCEDURE get_uppercase_text_proc  (
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
END;

--private function, because not exposed into "spec"
FUNCTION private_function (source_text in varchar2) return varchar2 is
BEGIN
   DBMS_OUTPUT.put_line('private called');
   RETURN 'private called';
END;

END UPPER_CASE_PKG;
/
