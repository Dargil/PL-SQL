SET SERVEROUTPUT ON
declare                                                                                         
  bonus  number;
BEGIN
  bonus := 100;
  CASE 
    WHEN bonus >500 THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    WHEN bonus <= 500 and bonus > 250 THEN DBMS_OUTPUT.PUT_LINE('Very Good');
    WHEN bonus <= 250 and bonus > 100 THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE DBMS_OUTPUT.PUT_LINE('POOR¡¡¡¡');
  END CASE;
END;
/          

--SEARCHED CASE