CREATE OR REPLACE PACKAGE MY_TYPES_EXAMPLE_PKG AS

    TYPE int_arr IS VARRAY(4) OF INTEGER; -- VARRAY type

    TYPE example_record IS RECORD (  -- create object (i cannot use OBJECT here, but only RECORD)
        id_num INTEGER(4),
        val1 VARCHAR2(25),
        val2 VARCHAR2(35),
        intArr int_arr);
        
        
        --multimensional ARRAY
        TYPE t1 IS VARRAY(10) OF INTEGER;  -- varray of integer
        TYPE nt1 IS VARRAY(10) OF t1;      -- varray of varray of integer

    FUNCTION TYPES_EXAMPLE RETURN NUMBER;

END MY_TYPES_EXAMPLE_PKG;
/
