--12 de Octubre

-- examen 4
-- PARTE 1
--1. Crear un tablespace llamado "mid_term", este solamente tendrá un datafile de 50Mb.

create TABLESPACE mid_term
DATAFILE 'datmid.dat' SIZE 50M
ONLINE;

--2. Crear un usuario con espacio ilimitado en el tablespace "mid_term", el nombre de usuario será la inicial de su nombre
--y el primer apellido completo (Ejemplo: amartinez).

create user nlopez   -- crear uusario
identified by nlopez
default tablespace mid_term
quota UNLIMITED on mid_term;

grant DBA, connect to nlopez

--Crear 2 roles:
--El primer role se llamará "MINI_DBA" y este tendrá los privilegios de Crear Secuencias y crear tablas.
--El segundo role se llamará "STUDENT" y este tendrá el privilegio de crear sesión y adicional tendrá anidado el role de "MINI_DBA".

create ROLE  MINI_DBA 
grant create any table to MINI_DBA;

create ROLE  STUDENT 

grant connect to STUDENT
grant STUDENT to nlopez

grant connect to MINI_DBA
grant MINI_DBA to nlopez

--Parte II (Loguearse con el usuario y crear lo siguiente):

--Secuencias:
--Crear 2 secuencias:
-- MUNICIPIOS_SEQ: Deberá comenzar en 10 y tener un valor máximo de 100 con incrementos de 1.
-- CAPTURAS_SEQ:  Deberá comenzar en 5000 y tener un valor máximo de 6000 con incrementos de 1.

create sequence MUNICIPIOS_SEQ

create sequence MUNICIPIOS_SEQ
  start with 1
  increment by 1
  maxvalue 100
  minvalue 1;

create sequence CAPTURAS_SEQ

create sequence CAPTURAS_SEQ
  start with 1
  increment by 1
  maxvalue 6000
  minvalue 1;
  
--Tablas:
--Las tablas deberán tener su propio ID integer autoincremental y deberán crearse todas las claves foráneas a que hubiere lugar. 
--Los campos numéricos son de tipo INTEGER y los de texto VARCHAR2(255)
-- tabla   MUNICIPIOS: ID, NOMBRE
---tabla   CAPTURAS: ID, FECHA, DEPARTAMENTO, MUNICIPIO_ID (CLAVE FORÁNEA), DIA, BARRIO, ZONA, CLASE_SITIO, EDAD, SEXO, ESTADO CIVIL, 
--                  CLASE_EMPLEADO, PROFESION, ESCOLARIDAD, DELITO

CREATE TABLE MUNICIPIOS
( id INT NOT NULL,   
  name VARCHAR2(255 CHAR) NOT NULL    
 );
 
CONSTRAINT MUNICIPIOS_pk PRIMARY KEY (id),
CONSTRAINT fk_name FOREIGN KEY (name) REFERENCES names(id)
 
 CREATE TABLE CAPTURAS
( id INT NOT NULL,   
  DEPARTAMENTO VARCHAR2(20 CHAR) NOT NULL,    
  MUNICIPIO_ID VARCHAR2(255 CHAR) NOT NULL,    
  FECHA DATE NOT NULL,
  DIA VARCHAR2(20 CHAR) NOT NULL,
  BARRIO VARCHAR2(20 CHAR) DEFAULT 'ACTVE' NOT NULL, 
  ZONA VARCHAR2(255 CHAR),
  CLASE_SITIO INT NOT NULL, 
  EDAD VARCHAR2(255 CHAR),
  SEXO INT NOT NULL, 
  ESTADO_CIVIL VARCHAR2(20 CHAR) NOT NULL,
  CLASE_EMPLEADO VARCHAR2(20 CHAR) DEFAULT 'ACTVE' NOT NULL,  
  PROFESION VARCHAR2(255 CHAR),
  ESCOLARIDAD INT NOT NULL, 
  DELITO VARCHAR2(255 CHAR)
  );
 
 CONSTRAINT CAPTURAS_pk PRIMARY KEY (id),

CONSTRAINT fk_CAPTURAS FOREIGN KEY (CAPTURAS_id) REFERENCES CAPTURAS(id)
 
 


