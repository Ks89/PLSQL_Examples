CREATE OR REPLACE PACKAGE BODY MY_TYPES_EXAMPLE_PKG AS

FUNCTION TYPES_EXAMPLE RETURN NUMBER IS
    --vararray example
    int_array MY_TYPES_EXAMPLE_PKG.int_arr := int_arr(1, 4, 8, 16);
    
    --record example
    ex_obj MY_TYPES_EXAMPLE_PKG.example_record;
    
    --multimensional vararray
    va MY_TYPES_EXAMPLE_PKG.t1 := t1(2,3,5);
    nva MY_TYPES_EXAMPLE_PKG.nt1 := nt1(va, t1(55,6,73), t1(2,4), va);
    i INTEGER;
    va1 t1;
    
BEGIN

   --record
    ex_obj.id_num := 22;
    ex_obj.val1 := 'pippo';
    ex_obj.val2 := 'pluto';
    ex_obj.intArr := int_arr(1, 4, 8, 16);
    
   --with this code I print the record field by field
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

    --multidimensional array
    i := nva(2)(3);
    DBMS_OUTPUT.PUT_LINE('i = ' || i);

    nva.EXTEND;
    nva(5) := t1(56, 32);          -- replace inner varray elements
    nva(4) := t1(45,43,67,43345);  -- replace an inner integer element
    nva(4)(4) := 1;                -- replace 43345 with 1

    nva(4).EXTEND;    -- add element to 4th varray element
    nva(4)(5) := 89;  -- store integer 89 there
    
   FOR i IN 1..nva.count LOOP 
         FOR j IN 1..nva(i).count LOOP 
            DBMS_OUTPUT.PUT_LINE('i: ' || i || ', j: ' || j || ', val= ' || nva(i)(j));
        END LOOP; 
   END LOOP; 
        

    RETURN 0;
END;

END MY_TYPES_EXAMPLE_PKG;
/
