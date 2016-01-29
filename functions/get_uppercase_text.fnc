CREATE OR REPLACE FUNCTION get_uppercase_text (source_text in varchar2) return varchar2 is

BEGIN
   DBMS_OUTPUT.put_line(UPPER(source_text));
   RETURN UPPER(source_text);
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END get_uppercase_text;
/
