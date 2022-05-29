set serveroutput on
DECLARE
  A NUMBER;
  B NUMBER;
  R NUMBER;
begin
  A:=120;
  B:=10;
  R:=0;
 CALC_TAX_OUT(A,B,R);
 DBMS_OUTPUT.PUT_LINE('R='||R);
end;
/