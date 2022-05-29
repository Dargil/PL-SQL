create or replace PACKAGE lineas_FACTURASP AS
PROCEDURE ALTA_linea (COdigo number,cod_prod NUMBER,unid number,FEC DATE);
PROCEDURE BAJA_linea (CODIGO number,cod_prod NUMBER);
PROCEDURE MOD_producto(CODIGO NUMBER,cod_prod number,unid number);
PROCEDURE mod_producto(CODIGO NUMBER, cod_prod number, FECHA_MOD DATE);
FUNCTION NUM_lineas (CODIGO number) RETURN NUMBER;

END lineas_FACTURASp;
/



create or replace PACKAGE BODY lineas_facturasp AS

--FUNCIÓN ADICIONAL PARA COMPROBAR SI EXISTE UNA FACTURA, Se trata de una función PRIVADA

    FUNCTION existe (
        codigo NUMBER,
        cod_prod number
    ) RETURN BOOLEAN IS
        cont   NUMBER := 0;
        cod_f lineas_factura.cod_factura%type;


    BEGIN
 --Comprobar si existe la factura:
       SELECT
            cod_factura into cod_f FROM  lineas_factura
            where cod_factura=codigo and cod_producto=cod_prod;
            RETURN true;
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            return false;
        WHEN OTHERS THEN 
             RAISE_APPLICATION_ERROR(-20000,'ERROR'|| sqlcode);
    END;

--PROCEDURE ALTA_FACTURA

    PROCEDURE ALTA_linea (COdigo number,cod_prod NUMBER, unid number,FEC DATE)
     AS
        devuelto   BOOLEAN;
        erroryaexiste EXCEPTION;

        PRECIO NUMBER;
    BEGIN
        devuelto := existe(codigo,COD_PROD);
        IF not devuelto THEN 
            select PVP into PRECIO from productos where cod_producto=cod_prod;
            INSERT INTO LINEAS_factura VALUES (CODIGO,COD_PROD,PRECIO,UNID,fec );
            commit;
        ELSE
            RAISE erroryaexiste;
        END IF;

    EXCEPTION
        WHEN erroryaexiste THEN
            RAISE_APPLICATION_ERROR(-20001,'ERROR, ESA FACTURA-PRODUCTO YA EXISTE, NO SE ADMITEN DUPLICADOS');
        WHEN NO_DATA_FOUND THEN
             RAISE_APPLICATION_ERROR(-20002,'ERROR, EL PRODUCTO NO EXISTE');
        WHEN OTHERS THEN 
           RAISE_APPLICATION_ERROR(-20000,'ERROR'|| sqlcode);
    END;

--PROCEDURE BAJA_FACTURA.

    PROCEDURE baja_LINEA (
        codigo NUMBER,COD_PROD NUMBER
    ) AS
        errornoexiste EXCEPTION;
        devuelto   BOOLEAN;
    BEGIN
        devuelto := existe(codigo,cod_prod);
        IF
            devuelto = true
        THEN
            DELETE FROM lineas_factura WHERE
                cod_factura = codigo AND COD_PRODUCTO=COD_PROD;


                commit;

        ELSE
            RAISE errornoexiste;
        END IF;

    EXCEPTION
        WHEN errornoexiste THEN
           RAISE_APPLICATION_ERROR(-20001,'ERROR, ESE NÚMERO DE FACTURA -PRODUCTO NO EXISTE');
        WHEN OTHERS THEN 
           RAISE_APPLICATION_ERROR(-20000,'ERROR'|| sqlcode);
    END;

--Procedure MOD_FECHA

    PROCEDURE mod_producto (
        codigo NUMBER,
        cod_prod number,
        fecha_mod DATE
    ) IS
        devuelto   BOOLEAN;
        errornoexiste EXCEPTION;
    BEGIN
        devuelto := existe(codigo,cod_prod);
        IF
            devuelto = true
        THEN
            UPDATE lineas_factura
                SET
                    fecha = fecha_mod
            WHERE
                cod_factura = codigo and cod_producto=cod_prod;
            commit;
        ELSE
            RAISE errornoexiste;
        END IF;

    EXCEPTION
         WHEN errornoexiste THEN
           RAISE_APPLICATION_ERROR(-20001,'ERROR, ESE NÚMERO DE FACTURA NO EXISTE');
        WHEN OTHERS THEN 
           RAISE_APPLICATION_ERROR(-20000,'ERROR'|| sqlcode);
    END;

     PROCEDURE mod_producto (
        codigo NUMBER,
        cod_prod number,
        unid number
    ) IS
        devuelto   BOOLEAN;
        errornoexiste EXCEPTION;
    BEGIN
        devuelto := existe(codigo,cod_prod);
        IF
            devuelto = true
        THEN
            UPDATE lineas_factura a
                SET
                    unidades=unid, pvp=(select pvp from productos where cod_producto=a.cod_producto)
            WHERE
                cod_factura = codigo and cod_producto=cod_prod;
            commit;
        ELSE
            RAISE errornoexiste;
        END IF;

    EXCEPTION
         WHEN errornoexiste THEN
           RAISE_APPLICATION_ERROR(-20001,'ERROR, ESE NÚMERO DE FACTURA NO EXISTE');
        WHEN OTHERS THEN 
           RAISE_APPLICATION_ERROR(-20000,'ERROR'|| sqlcode);
    END;

--Función NUM_FACTURAS

    FUNCTION num_lineas (
        CODIGO NUMBER
    ) RETURN NUMBER AS
        cont   NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO CONT FROM lineas_FACTURA  WHERE   COD_FACTURA=CODIGO;

        RETURN cont;
    END;

--FUNCION TOTAL_FACTURA


END lineas_facturasp;
