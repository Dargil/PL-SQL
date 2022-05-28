DECLARE
  s  PLS_INTEGER := 0;
  i  PLS_INTEGER := 0;
  j  PLS_INTEGER;
BEGIN
  <<parent>>
  LOOP
    i := i + 1;
    j := 100;
    DBMS_OUTPUT.PUT_LINE('Parent:'||i);
    <<child>>
    LOOP
      --Print child
      dbms_output.put_line('Child:'||j);
      j:=j+1;
     
      EXIT parent WHEN (i> 3);
      EXIT child WHEN (j > 105);
    END LOOP child;
  END LOOP parent;
  DBMS_OUTPUT.PUT_LINE('FINISH¡¡¡');
END;
/
 