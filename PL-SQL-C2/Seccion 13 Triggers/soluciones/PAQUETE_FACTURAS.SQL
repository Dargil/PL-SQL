create or replace PACKAGE FACTURASP AS
PROCEDURE ALTA_FACTURA (CODIGO NUMBER, FECHA DATE, DESCRIP VARCHAR2);
PROCEDURE BAJA_FACTURA (CODIGO NUMBER);
PROCEDURE MOD_DESCRI(CODIGO NUMBER,DESCRI VARCHAR2);
PROCEDURE MOD_FECHA(CODIGO NUMBER, FECHA_MOD DATE);
FUNCTION NUM_FACTURAS (FECHA_INICIO DATE,FECHA_FIN DATE) RETURN NUMBER;
FUNCTION TOTAL_FACTURA(CODIGO NUMBER) RETURN NUMBER; 
END FACTURASp;
/


create or replace PACKAGE BODY facturasp AS

--FUNCIÓN ADICIONAL PARA COMPROBAR SI EXISTE UNA FACTURA, Se trata de una función PRIVADA

    FUNCTION existe (
        codigo NUMBER
    ) RETURN BOOLEAN IS
        cont   NUMBER := 0;
        cod_f facturas.cod_factura%type;

    BEGIN
 --Comprobar si existe la factura:
       SELECT
            cod_factura into cod_f FROM  facturas
            where cod_factura=codigo;
            RETURN true;
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            return false;
        WHEN OTHERS THEN 
             RAISE_APPLICATION_ERROR(-20000,'ERROR'|| sqlcode);
    END;

--PROCEDURE ALTA_FACTURA

    PROCEDURE alta_factura (
        codigo    NUMBER,
        fecha     DATE,
        descrip   VARCHAR2
    ) AS
        devuelto   BOOLEAN;
        erroryaexiste EXCEPTION;
    BEGIN
        devuelto := existe(codigo);
        IF not devuelto   THEN 
            INSERT INTO facturas VALUES (codigo,fecha, descrip );
            commit;

        ELSE
            RAISE erroryaexiste;
        END IF;

    EXCEPTION
        WHEN erroryaexiste THEN
            RAISE_APPLICATION_ERROR(-20001,'ERROR, ESE NÚMERO DE FACTURA YA EXISTE, NO SE ADMITEN DUPLICADOS');
        WHEN OTHERS THEN 
           RAISE_APPLICATION_ERROR(-20000,'ERROR'|| sqlcode);
    END;

--PROCEDURE BAJA_FACTURA.

    PROCEDURE baja_factura (
        codigo NUMBER
    ) AS
        errornoexiste EXCEPTION;
        devuelto   BOOLEAN;
    BEGIN
        devuelto := existe(codigo);
        IF
            devuelto = true
        THEN
            DELETE FROM lineas_factura WHERE
                cod_factura = codigo;

            DELETE FROM facturas WHERE
                cod_factura = codigo;
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

--PROCEDURE MOD_DESCRI

    PROCEDURE mod_descri (
        codigo NUMBER,
        descri VARCHAR2
    ) AS
        errornoexiste EXCEPTION;
        devuelto   BOOLEAN;
    BEGIN
        devuelto := existe(codigo);
        IF
            devuelto = true
        THEN
            UPDATE facturaS
                SET
                    descripcion = descri
            WHERE
                cod_factura = codigo;
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


--Procedure MOD_FECHA

    PROCEDURE mod_fecha (
        codigo NUMBER,
        fecha_mod DATE
    ) IS
        devuelto   BOOLEAN;
        errornoexiste EXCEPTION;
    BEGIN
        devuelto := existe(codigo);
        IF
            devuelto = true
        THEN
            UPDATE facturas
                SET
                    fecha = fecha_mod
            WHERE
                cod_factura = codigo;
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

    FUNCTION num_facturas (
        fecha_inicio DATE,
        fecha_fin DATE
    ) RETURN NUMBER AS
        cont   NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO CONT FROM FACTURAS  WHERE   fecha BETWEEN fecha_inicio AND fecha_fin;

        RETURN cont;
    END;

--FUNCION TOTAL_FACTURA

    FUNCTION total_factura (
        codigo NUMBER
    ) RETURN NUMBER AS
        total_a_devolver   NUMBER;
    BEGIN
        SELECT
            SUM(pvp*UNIDADES)
        INTO
            total_a_devolver
        FROM
            lineas_factura
        WHERE
            cod_factura = codigo;

        RETURN total_a_devolver;
    END;

END facturasp;
