CREATE OR REPLACE PACKAGE UPPER_CASE_PKG AS


    FUNCTION get_uppercase_tex(source_text in varchar2) return varchar2;
    PROCEDURE get_uppercase_text_proc  (
        source_text IN USELESS_CONFIG_TABLE.VALORE%type,
        output_text OUT MYTEST.ADDITIONAL_DESC%type,
        err_text OUT NUMBER);

END UPPER_CASE_PKG;
/
