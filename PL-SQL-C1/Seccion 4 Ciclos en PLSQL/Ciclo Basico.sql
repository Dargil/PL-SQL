set serveroutput on;

DECLARE

    x number := 10;

BEGIN

      LOOP
        
        dbms_output.put_line( x );
        x := x + 10;
      
      
        if( x > 120 ) then
          exit;
       end if;
      
      END LOOP;

	while x<100 LOOP
		dbms_output.put_line( x );
		 x := x + 10;
	end loop


END;
/