set serveroutput on
DECLARE
  A NUMBER;
  B NUMBER;
  R NUMBER;
begin
  A:=120;
  B:=10;
 -- R:=1000;
 CALC_TAX_IN_OUT(A,B);
 DBMS_OUTPUT.PUT_LINE('B='||B);
end;
/