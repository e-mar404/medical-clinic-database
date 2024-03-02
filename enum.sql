CREATE TABLE medical_roles(
	id CHAR(1) PRIMARY KEY,
    	role ENUM('doctor', 'nurse')
);

INSERT INTO medical_roles (id, role) VALUES ('1', 'doctor'), ('2', 'nurse');

CREATE TABLE staff_roles(
	id CHAR(1) PRIMARY KEY,
    	role ENUM('admin', 'receptionist')
);

INSERT INTO staff_roles (id, role) VALUES ('1', 'admin'), ('2', 'receptionist');

CREATE TABLE form_status (
	id CHAR(1) PRIMARY KEY,
    	role ENUM('scheduled', 'in_progress', 'past', 'canceled')
);

INSERT INTO form_status (id, role) VALUES ('1', 'scheduled'), ('2', 'in_progress'), ('3', 'past'), ('4', 'canceled');
