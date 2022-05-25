CREATE OR REPLACE PROCEDURE hola_mundo
AS
BEGIN
    
    dbms_output.put_line('Hola Mundo');

END;
/


--llamar un procedimeinto almacenado plsql

execute hola_mundo();