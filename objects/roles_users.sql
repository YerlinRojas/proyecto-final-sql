USE centralmedical_db; 

-- CREATE USER
CREATE USER 'admin_super'@'%' IDENTIFIED BY 'password';

-- GRANT ALL PRIVILEGES ON centralmedical_db.* TO 'admin_super'@'%'
GRANT ALL PRIVILEGES ON centralmedical_db.* TO 'admin_super'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

-- CREACIÓN DE ROLES
CREATE ROLE role_select_vistas;
CREATE ROLE role_doctors;
CREATE ROLE role_patients;
CREATE ROLE role_admin;

-- ASIGNACIÓN DE PRIVILEGIOS AL ROL role_select_vistas
GRANT SELECT ON patients TO role_select_vistas;
GRANT SELECT ON doctors TO role_select_vistas;
GRANT SELECT ON appointments TO role_select_vistas;
GRANT SELECT ON availabilityDate TO role_select_vistas;
GRANT SELECT ON medical_history TO role_select_vistas;
GRANT SELECT ON therapy TO role_select_vistas;

-- ASIGNACIÓN DE PRIVILEGIOS AL ROL role_doctors
GRANT ALL PRIVILEGES ON appointments TO role_doctors;
GRANT ALL PRIVILEGES ON medical_history TO role_doctors;
GRANT ALL PRIVILEGES ON therapy TO role_doctors;

-- ASIGNACIÓN DE PRIVILEGIOS AL ROL role_patients
GRANT SELECT ON availabilityDate TO role_patients;

-- CREACIÓN DE USUARIOS Y ASIGNACIÓN A ROLES
CREATE USER 'usuario_select'@'%' IDENTIFIED BY 'password_select';
GRANT role_select_vistas TO 'usuario_select'@'%';

CREATE USER 'usuario_doctors'@'%' IDENTIFIED BY 'password_doctors';
GRANT role_doctors TO 'usuario_select'@'%';

FLUSH PRIVILEGES;
