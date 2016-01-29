--like IN, =ANY, =SOME
SELECT *
FROM TEST1 t1
WHERE t1.EMAIL1 IN (SELECT t2.EMAIL2
                            FROM TEST2 t2
                            );
--like IN, =ANY, =SOME
SELECT *
FROM TEST1 t1
WHERE t1.EMAIL1 =ANY (SELECT t2.EMAIL2
                            FROM TEST2 t2
                            );
--like IN, =ANY, =SOME                            
SELECT *
FROM TEST1 t1
WHERE t1.EMAIL1 =SOME (SELECT t2.EMAIL2
                            FROM TEST2 t2
                            );

--like NOT IN, !=ALL
SELECT *
FROM TEST1 t1
WHERE t1.EMAIL1 NOT IN (SELECT t2.EMAIL2
                            FROM TEST2 t2
                            );    
--like NOT IN, !=ALL
SELECT *
FROM TEST1 t1
WHERE t1.EMAIL1 != ALL (SELECT t2.EMAIL2
                            FROM TEST2 t2
                            );


----------------------------------------------------------------------------------------------


--Example of EXISTS that return: G\J\L\N
SELECT *
FROM TEST1 t1
WHERE EXISTS (SELECT *
                        FROM TEST2 t2
                        WHERE t2.AMOUNT = t1.AMOUNT
                        );          
                        
----------------------------------------------------------------------------------------------

                       
--Example of  GROUP BY and SUM and HAVNG
SELECT t1.DATA1, sum(t1.AMOUNT) AS "SUM_AMOUNT"
FROM TEST1 t1
GROUP BY t1.DATA1
HAVING sum(t1.AMOUNT)>0;
  
                      
----------------------------------------------------------------------------------------------


-- Example of  < ALL
-- The value must be smaller than the smallest value in the list to evaluate to TRUE.
-- All values from t1 smaller than the smallest in t2
SELECT *
FROM TEST1 t1
WHERE t1.AMOUNT < ALL (SELECT t2.AMOUNT
                            FROM TEST2 t2
                            );
-- Example of  > ALL
-- The value must be greater than the greatest value in the list to evaluate to TRUE.
-- All values from t1 greater than the biggest in t2
SELECT *
FROM TEST1 t1
WHERE t1.AMOUNT > ALL (SELECT t2.AMOUNT
                            FROM TEST2 t2
                            );


----------------------------------------------------------------------------------------------
 
                           
-- Example of  > ANY
-- "E" excluded
-- The value must be greater than the smallest value in the list to evaluate to TRUE.
-- ALL values excuded the MINIMUM
SELECT *
FROM TEST1 t1
WHERE t1.AMOUNT > ANY (SELECT t2.AMOUNT
                            FROM TEST2 t2
                            );
-- Example of  < ANY
-- "I" excluded
-- The value must be smaller than the biggest value in the list to evaluate to TRUE.
-- ALL values excuded the MAXIMUM
SELECT *
FROM TEST1 t1
WHERE t1.AMOUNT < ANY (SELECT t2.AMOUNT
                            FROM TEST2 t2
                            );
                            
                            
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------                            
---------------------------------------------------------------------------------------------


-- Eqivalent of  > ALL
SELECT *
FROM TEST1 t1
WHERE t1.AMOUNT > (SELECT MAX(t2.AMOUNT)
                            FROM TEST2 t2
                            );
-- Eqivalent of  < ALL
SELECT *
FROM TEST1 t1
WHERE t1.AMOUNT < (SELECT MIN(t2.AMOUNT)
                            FROM TEST2 t2
                            );
-- Equivalent of  > ANY                            
SELECT *
FROM TEST1 t1
WHERE t1.AMOUNT > (SELECT MIN(t2.AMOUNT)
                            FROM TEST2 t2
                            );
-- Equivalent of  < ANY                            
SELECT *
FROM TEST1 t1
WHERE t1.AMOUNT < (SELECT MAX(t2.AMOUNT)
                            FROM TEST2 t2
                            );