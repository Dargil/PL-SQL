SET SERVEROUTPUT ON
declare                                                                                         
  v1 CHAR(1);
BEGIN
  v1 := 'B';
  CASE v1
    WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    WHEN 'B' THEN DBMS_OUTPUT.PUT_LINE('Very Good');
    WHEN 'C' THEN DBMS_OUTPUT.PUT_LINE('Good');
    WHEN 'D' THEN DBMS_OUTPUT.PUT_LINE('Fair');
    WHEN 'F' THEN DBMS_OUTPUT.PUT_LINE('Poor');
    ELSE DBMS_OUTPUT.PUT_LINE('POOR¡¡¡¡');
  END CASE;
END;
/                                                                                                                                 