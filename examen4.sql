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




 


