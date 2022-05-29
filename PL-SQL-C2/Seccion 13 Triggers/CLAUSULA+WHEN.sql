create or replace TRIGGER TR1_REGION 
BEFORE INSERT OR UPDATE OR DELETE
ON REGIONS 
FOR EACH ROW
WHEN (NEW.REGION_ID> 1000)
BEGIN 
   IF INSERTING THEN
    :NEW.REGION_NAME:=UPPER(:NEW.REGION_NAME);
     INSERT INTO LOG_TABLE VALUES ('INSERCION',USER);
   END IF;
   IF UPDATING('REGION_NAME') THEN
      :NEW.REGION_NAME:=UPPER(:NEW.REGION_NAME);
      INSERT INTO LOG_TABLE VALUES ('UPDATE DE REGION_NAME', USER);
   END IF;
   IF UPDATING('REGION_ID') THEN
      INSERT INTO LOG_TABLE VALUES ('UPDATE DE REGION_ID', USER);
   END IF;
   IF DELETING  THEN
      INSERT INTO LOG_TABLE VALUES ('DELETE', USER);
   END IF;
   
  /*IF USER <>'HR' THEN
    RAISE_APPLICATION_ERROR(-20000,'SOLO HR PUEDE TRABAJAR EN REGIONS');
  END IF;*/
  
END;