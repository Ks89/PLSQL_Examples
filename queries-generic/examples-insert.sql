INSERT INTO USELESS_CONFIG_TABLE (
   GRUPPO, PARAMETRO, VALORE) 
VALUES ( 'AA',
 'BB',
 'CC' );
 
 
 SELECT A.*
 FROM USELESS_CONFIG_TABLE A;
 
 INSERT INTO test1 VALUES (‘valore1’, ‘valore2’) RETURNING campo1, campo2 INTO :t1, :t2; 
 
  SELECT A.*
 FROM USELESS_CONFIG_TABLE A
 WHERE A.GRUPPO LIKE '%f%' ;
 
  
SELECT A.GRUPPO
   FROM USELESS_CONFIG_TABLE A
   WHERE A.GRUPPO
   LIKE '%_ZZ' ESCAPE'%'; 
   
  
SELECT A.GRUPPO
   FROM USELESS_CONFIG_TABLE A
   WHERE A.GRUPPO IN (--  'gdfh', 'fgvhbjnk'); 
                                SELECT A.GRUPPO
                                   FROM USELESS_CONFIG_TABLE A
                                   WHERE A.GRUPPO LIKE '%f%'
                                 )
union all
SELECT A.GRUPPO
   FROM USELESS_CONFIG_TABLE A
   WHERE A.GRUPPO IN (--  'gdfh', 'fgvhbjnk'); 
                                SELECT A.GRUPPO
                                   FROM USELESS_CONFIG_TABLE A
                                   WHERE A.GRUPPO LIKE '%f%'
                                 );