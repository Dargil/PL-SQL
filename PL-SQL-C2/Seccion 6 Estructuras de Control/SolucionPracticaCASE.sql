SET SERVEROUTPUT ON

DECLARE
  USUARIO VARCHAR2(30);
BEGIN
  USUARIO:=USER;  
CASE USUARIO
  WHEN 'SYS' THEN DBMS_OUTPUT.PUT_LINE('ERES SUPERADMINISTRADOR');
  WHEN 'SYSTEM' THEN DBMS_OUTPUT.PUT_LINE('ERES ADMINISTRADOR NORMAL');
  WHEN 'HR' THEN DBMS_OUTPUT.PUT_LINE('ERES DE RECURSOS HUMANOS');
  ELSE DBMS_OUTPUT.PUT_LINE('USUARIO NO AUTORIZADO');
END CASE;
END;