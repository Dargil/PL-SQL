CREATE OR REPLACE function edad_actual( fechanaci  in date  )
return number is
    edad number(3):=0;
    
BEGIN
        
    edad:=  trunc((to_number(to_char(sysdate,'yyyymmdd')) -to_number(to_char( fechanaci,'yyyymmdd')))/10000) ;
    
    return edad;
    
    EXCEPTION   
    WHEN OTHERS then
        edad:=0;
          
    RETURN  edad;    
END;
/

--- Forma de llamar la funcion 

select FECHANACI,edad_actual(FECHANACI), SYSDATE from empleados
where edad_actual(FECHANACI)>35