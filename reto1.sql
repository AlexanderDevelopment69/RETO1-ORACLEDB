-- Creacion de tablas
-- tabla Gerente
CREATE TABLE Gerente (
    idGerente NUMBER PRIMARY KEY,
    descGerente VARCHAR2(100),
    fechaRegistro DATE
);

-- tabla Condicion
CREATE TABLE Condicion (
    idCondicion NUMBER PRIMARY KEY,
    descCondicion VARCHAR2(100),
    fechaRegistro DATE
);


-- tabla Provincia
CREATE TABLE Provincia (
    idProvincia NUMBER PRIMARY KEY,
    descProvincia VARCHAR2(100),
    fechaRegistro DATE
);

-- tabla Distrito
CREATE TABLE Distrito (
    idDistrito NUMBER PRIMARY KEY,
    idProvincia NUMBER,
    descDistrito VARCHAR2(100),
    fechaRegistro DATE,
    FOREIGN KEY (idProvincia) REFERENCES Provincia(idProvincia)
);

-- tabla Sede
CREATE TABLE Sede (
    idSede NUMBER PRIMARY KEY,
    descSede VARCHAR2(100),
    fechaRegistro DATE
);


-- crea tabla Hospital
CREATE TABLE Hospital (
    idHospital NUMBER PRIMARY KEY,
    idDistrito NUMBER,
    nombre VARCHAR2(100),
    antiguedad NUMBER,
    area NUMBER(5,2),
    idSede NUMBER,
    idGerente NUMBER,
    idCondicion NUMBER,
    fechaRegistro DATE,
    FOREIGN KEY (idDistrito) REFERENCES Distrito(idDistrito),
    FOREIGN KEY (idSede) REFERENCES Sede(idSede),
    FOREIGN KEY (idGerente) REFERENCES Gerente(idGerente),
    FOREIGN KEY (idCondicion) REFERENCES Condicion(idCondicion)
);

-- Inserción de registros en las tablas:
--Gerente
INSERT INTO Gerente (idGerente, descGerente, fechaRegistro) VALUES (1, 'gerente 1', SYSDATE);
INSERT INTO Gerente (idGerente, descGerente, fechaRegistro) VALUES (2, 'gerente 2', SYSDATE);
INSERT INTO Gerente (idGerente, descGerente, fechaRegistro) VALUES (3, 'gerente 3', SYSDATE);
INSERT INTO Gerente (idGerente, descGerente, fechaRegistro) VALUES (4, 'gerente 4', SYSDATE);
INSERT INTO Gerente (idGerente, descGerente, fechaRegistro) VALUES (5, 'gerente 5', SYSDATE);
--Condicion
INSERT INTO Condicion (idCondicion, descCondicion, fechaRegistro) VALUES (1, 'condicion 1', SYSDATE);
INSERT INTO Condicion (idCondicion, descCondicion, fechaRegistro) VALUES (2, 'condicion 2', SYSDATE);
INSERT INTO Condicion (idCondicion, descCondicion, fechaRegistro) VALUES (3, 'condicion 3', SYSDATE);
INSERT INTO Condicion (idCondicion, descCondicion, fechaRegistro) VALUES (4, 'condicion 4', SYSDATE);
INSERT INTO Condicion (idCondicion, descCondicion, fechaRegistro) VALUES (5, 'condicion 5', SYSDATE);
--Distrito
INSERT INTO Distrito (idDistrito, idProvincia, descDistrito, fechaRegistro) VALUES (1, 1, 'distrito 1', SYSDATE);
INSERT INTO Distrito (idDistrito, idProvincia, descDistrito, fechaRegistro) VALUES (2, 2, 'distrito 2', SYSDATE);
INSERT INTO Distrito (idDistrito, idProvincia, descDistrito, fechaRegistro) VALUES (3, 2, 'distrito 3', SYSDATE);
INSERT INTO Distrito (idDistrito, idProvincia, descDistrito, fechaRegistro) VALUES (4, 2, 'distrito 4', SYSDATE);
INSERT INTO Distrito (idDistrito, idProvincia, descDistrito, fechaRegistro) VALUES (5, 2, 'distrito 5', SYSDATE);
--Sede
INSERT INTO Sede (idSede, descSede, fechaRegistro) VALUES (1, 'sede 1', SYSDATE);
INSERT INTO Sede (idSede, descSede, fechaRegistro) VALUES (2, 'sede 2', SYSDATE);
INSERT INTO Sede (idSede, descSede, fechaRegistro) VALUES (3, 'sede 3', SYSDATE);
INSERT INTO Sede (idSede, descSede, fechaRegistro) VALUES (4, 'sede 4', SYSDATE);
INSERT INTO Sede (idSede, descSede, fechaRegistro) VALUES (5, 'sede 5', SYSDATE);
--Provincia
INSERT INTO Provincia (idProvincia, descProvincia, fechaRegistro) VALUES (1, 'provincia 1', SYSDATE);
INSERT INTO Provincia (idProvincia, descProvincia, fechaRegistro) VALUES (2, 'provincia 2', SYSDATE);
INSERT INTO Provincia (idProvincia, descProvincia, fechaRegistro) VALUES (3, 'provincia 3', SYSDATE);
INSERT INTO Provincia (idProvincia, descProvincia, fechaRegistro) VALUES (4, 'provincia 4', SYSDATE);
INSERT INTO Provincia (idProvincia, descProvincia, fechaRegistro) VALUES (5, 'provincia 5', SYSDATE);


-- 4 PROCEDIMIENTOS ALMACENADOS



/*
  Nombre del procedimiento: SP_HOSPITAL_REGISTRAR
  Descripcion: Este procedimiento registra un nuevo hospital en la tabla Hospital
  Autor: Alexander
  Fecha de creación: 02-07-2024
  Versión: 1
*/


-- SP_HOSPITAL_REGISTRAR
CREATE OR REPLACE PROCEDURE SP_HOSPITAL_REGISTRAR (
    p_idHospital IN NUMBER,
    p_idDistrito IN NUMBER,
    p_nombre IN VARCHAR2,
    p_antiguedad IN NUMBER,
    p_area IN NUMBER,
    p_idSede IN NUMBER,
    p_idGerente IN NUMBER,
    p_idCondicion IN NUMBER
) AS
BEGIN
    INSERT INTO Hospital (idHospital, idDistrito, nombre, antiguedad, area, idSede, idGerente, idCondicion, fechaRegistro)
    VALUES (p_idHospital, p_idDistrito, p_nombre, p_antiguedad, p_area, p_idSede, p_idGerente, p_idCondicion, SYSDATE);
    COMMIT;
END SP_HOSPITAL_REGISTRAR;


-- ejecucion del procedimiento almacenado SP_HOSPITAL_REGISTRAR
EXECUTE SP_HOSPITAL_REGISTRAR(p_idHospital => 1, p_idDistrito => 1, p_nombre => 'Hospital 1', p_antiguedad => 5, p_area => 100, p_idSede => 1, p_idGerente => 1, p_idCondicion => 1);
EXECUTE SP_HOSPITAL_REGISTRAR(p_idHospital => 2, p_idDistrito => 2, p_nombre => 'Hospital 2', p_antiguedad => 5, p_area => 100, p_idSede => 2, p_idGerente => 2, p_idCondicion => 2);
EXECUTE SP_HOSPITAL_REGISTRAR(p_idHospital => 3, p_idDistrito => 3, p_nombre => 'Hospital 3', p_antiguedad => 5, p_area => 100, p_idSede => 3, p_idGerente => 3, p_idCondicion => 3);
EXECUTE SP_HOSPITAL_REGISTRAR(p_idHospital => 4, p_idDistrito => 4, p_nombre => 'Hospital 4', p_antiguedad => 5, p_area => 100, p_idSede => 4, p_idGerente => 4, p_idCondicion => 4);
EXECUTE SP_HOSPITAL_REGISTRAR(p_idHospital => 5, p_idDistrito => 5, p_nombre => 'Hospital 5', p_antiguedad => 5, p_area => 100, p_idSede => 5, p_idGerente => 5, p_idCondicion => 5);

EXECUTE SP_HOSPITAL_REGISTRAR(p_idHospital => 6, p_idDistrito => 5, p_nombre => 'Hospital 5', p_antiguedad => 5, p_area => 100, p_idSede => 5, p_idGerente => 5, p_idCondicion => 5);
EXECUTE SP_HOSPITAL_REGISTRAR(p_idHospital => 7, p_idDistrito => 5, p_nombre => 'Hospital 5', p_antiguedad => 5, p_area => 100, p_idSede => 2, p_idGerente => 5, p_idCondicion => 5);
EXECUTE SP_HOSPITAL_REGISTRAR(p_idHospital => 8, p_idDistrito => 5, p_nombre => 'Hospital 5', p_antiguedad => 5, p_area => 100, p_idSede => 2, p_idGerente => 5, p_idCondicion => 5);
-- verifica el hospital registrado
SELECT * FROM Hospital;

select*from hospital;



/*
  Nombre del procedimiento: SP_HOSPITAL_ACTUALIZAR
  Descripcion: Este procedimiento actualiza la informacion de un hospital en la tabla Hospital basada en el ID del hospital proporcionado.
  Autor: Alexander
  Fecha de creación: 02-07-2024
  Versión: 1
*/


-- SP_HOSPITAL_ACTUALIZAR
CREATE OR REPLACE PROCEDURE SP_HOSPITAL_ACTUALIZAR (
    p_idHospital IN NUMBER,
    p_idDistrito IN NUMBER,
    p_nombre IN VARCHAR2,
    p_antiguedad IN NUMBER,
    p_area IN NUMBER,
    p_idSede IN NUMBER,
    p_idGerente IN NUMBER,
    p_idCondicion IN NUMBER
) AS
BEGIN
    UPDATE Hospital
    SET idDistrito = p_idDistrito,
        nombre = p_nombre,
        antiguedad = p_antiguedad,
        area = p_area,
        idSede = p_idSede,
        idGerente = p_idGerente,
        idCondicion = p_idCondicion,
        fechaRegistro = SYSDATE
    WHERE idHospital = p_idHospital;
    COMMIT;
END SP_HOSPITAL_ACTUALIZAR;


-- ejecucion del procedimiento almacenado SP_HOSPITAL_ACTUALIZAR
EXECUTE SP_HOSPITAL_ACTUALIZAR(p_idHospital => 1, p_idDistrito => 2, p_nombre => 'Hostipal actualizado', p_antiguedad => 6, p_area => 200, p_idSede => 2, p_idGerente => 2, p_idCondicion => 2);
-- verifica el hospital actualizado
SELECT * FROM Hospital WHERE idHospital = 1;



/*
  Nombre del procedimiento: SP_HOSPITAL_ELIMINAR
  Descripcion: Este procedimiento elimina un registro de la tabla Hospital basado en el ID del hospital proporcionado.
  Autor: Alexander
  Fecha de creación: 02-07-2024
  Versión: 1
*/

-- SP_HOSPITAL_ELIMINAR
CREATE OR REPLACE PROCEDURE SP_HOSPITAL_ELIMINAR (
    p_idHospital IN NUMBER
) AS
BEGIN
    DELETE FROM Hospital WHERE idHospital = p_idHospital;
    COMMIT;
END SP_HOSPITAL_ELIMINAR;


-- ejecucion del procedimiento almacenado SP_HOSPITAL_ELIMINAR
EXECUTE SP_HOSPITAL_ELIMINAR(p_idHospital => 1);
-- verifica que el hospital se elimino
SELECT * FROM Hospital WHERE idHospital = 1;



/*
  Nombre del procedimiento: SP_HOSPITAL_LISTAR
  Descripcion: Este procedimiento realiza una busqueda en la tabla Hospital basada en un campo y un valor especifico
  Autor: alexander
  Fecha de creación: 02-07-2024
  Versión: 1
*/


-- SP_SP_HOSPITAL_LISTAR
CREATE OR REPLACE PROCEDURE SP_HOSPITAL_LISTAR (
    p_field_name IN VARCHAR2,
    p_field_value IN VARCHAR2
) IS
    -- cursor para almacenar el resultado de la consulta
    v_idHospital Hospital.idHospital%TYPE;
    v_nombre Hospital.nombre%TYPE;
    v_antiguedad Hospital.antiguedad%TYPE;
    v_area Hospital.area%TYPE;
    v_idSede Hospital.idSede%TYPE;
    v_idGerente Hospital.idGerente%TYPE;
    v_idCondicion Hospital.idCondicion%TYPE;
    v_fechaRegistro Hospital.fechaRegistro%TYPE;
BEGIN
    -- consulta dinamica
    OPEN result_cursor FOR
        'SELECT idHospital, nombre, antiguedad, area, idSede, idGerente, idCondicion, fechaRegistro FROM Hospital WHERE ' || p_field_name || ' = :field_value'
        USING p_field_value;

    -- muestra los registros obtenidos
    DBMS_OUTPUT.PUT_LINE('Registros encontrados para el campo ' || p_field_name || ':');
    LOOP
        FETCH result_cursor INTO v_idHospital, v_nombre, v_antiguedad, v_area, v_idSede, v_idGerente, v_idCondicion, v_fechaRegistro;
        EXIT WHEN result_cursor%NOTFOUND;
        -- muestra los datos
        DBMS_OUTPUT.PUT_LINE('ID Hospital: ' || v_idHospital ||
                             ', Nombre: ' || v_nombre ||
                             ', Antigüedad: ' || v_antiguedad ||
                             ', Área: ' || v_area ||
                             ', ID Sede: ' || v_idSede ||
                             ', ID Gerente: ' || v_idGerente ||
                             ', ID Condición: ' || v_idCondicion ||
                             ', Fecha de Registro: ' || TO_CHAR(v_fechaRegistro, 'DD-MON-YYYY HH24:MI:SS'));
    END LOOP;
    CLOSE result_cursor;
END SP_HOSPITAL_LISTAR;

-- ejecucion del procedimiento almacenado SP_HOSPITAL_LISTAR
  EXECUTE SP_HOSPITAL_LISTAR('area', '100');

