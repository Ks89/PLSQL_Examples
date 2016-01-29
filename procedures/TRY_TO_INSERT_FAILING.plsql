CREATE OR REPLACE PROCEDURE TRY_TO_INSERT_FAILING (
first_num IN INTEGER,
second_num IN INTEGER,
err_code IN OUT INTEGER) AS

tmpVar INTEGER;
BEGIN
   tmpVar := first_num/second_num;
   
   err_code := 0;
   
   EXCEPTION
     WHEN ZERO_DIVIDE THEN
       err_code := 1;
     WHEN OTHERS THEN
       err_code := 2;
END TRY_TO_INSERT_FAILING;
/
