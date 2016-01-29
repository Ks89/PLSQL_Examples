CREATE OR REPLACE FUNCTION TYPES_EXAMPLE RETURN NUMBER IS
    int_array int_arr := int_arr(1, 4, 8, 16);
    ex_obj example_obj := example_obj(22, 'pippo', 'pluto', int_arr(1, 4, 8, 16));
BEGIN
    
   --object
   --with this code I print the object field by field
   DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
   DBMS_OUTPUT.PUT_LINE('The object has');
   DBMS_OUTPUT.PUT_LINE('       id: ' || ex_obj.id_num);
   DBMS_OUTPUT.PUT_LINE('       val1: ' || ex_obj.val1);
   DBMS_OUTPUT.PUT_LINE('       val2: ' || ex_obj.val2);
   DBMS_OUTPUT.PUT('       int_array=(  ');

    FOR i IN 1..4 LOOP
       DBMS_OUTPUT.PUT(' i: ' || i || ' val: ' || ex_obj.intArr(i) || ', ');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(')');
    
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
    
   --array
    FOR i IN 1..4 LOOP
        DBMS_OUTPUT.PUT_LINE('Position ' || i || ' has value: ' || int_array(i) );
    END LOOP;

    RETURN 0;

END TYPES_EXAMPLE;
/
