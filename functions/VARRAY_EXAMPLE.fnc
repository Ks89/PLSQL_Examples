CREATE OR REPLACE FUNCTION VARRAY_EXAMPLE RETURN NUMBER IS
    int_array int_arr := int_arr(1,4,8,16);
BEGIN

    FOR i IN 1..4 LOOP
        DBMS_OUTPUT.PUT_LINE('Position ' || i || ' has value: ' || int_array(i) );
    END LOOP;

    RETURN 0;

END VARRAY_EXAMPLE;
/
