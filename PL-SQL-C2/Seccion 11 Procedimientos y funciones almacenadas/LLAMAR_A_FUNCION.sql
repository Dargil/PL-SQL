set serveroutput on
DECLARE
  A NUMBER;
  B NUMBER;
  R NUMBER;
begin
  A:=120;
  B:=10;
  R:=CALC_TAX_F(A,B);
 DBMS_OUTPUT.PUT_LINE('R='||R);
end;
/