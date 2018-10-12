--12 de Octubre

-- examen 4
-- PARTE 1
--1. Crear un tablespace llamado "mid_term", este solamente tendr� un datafile de 50Mb.

create TABLESPACE mid_term
DATAFILE 'datmid.dat' SIZE 50M
ONLINE;

--2. Crear un usuario con espacio ilimitado en el tablespace "mid_term", el nombre de usuario ser� la inicial de su nombre
--y el primer apellido completo (Ejemplo: amartinez).

create user nlopez   -- crear uusario
identified by nlopez
default tablespace mid_term
quota UNLIMITED on mid_term;

grant DBA, connect to nlopez

--Crear 2 roles:
--El primer role se llamar� "MINI_DBA" y este tendr� los privilegios de Crear Secuencias y crear tablas.
--El segundo role se llamar� "STUDENT" y este tendr� el privilegio de crear sesi�n y adicional tendr� anidado el role de "MINI_DBA".

create ROLE  MINI_DBA 
grant create any table to MINI_DBA;

create ROLE  STUDENT 

grant connect to STUDENT
grant STUDENT to nlopez

grant connect to MINI_DBA
grant MINI_DBA to nlopez




 


