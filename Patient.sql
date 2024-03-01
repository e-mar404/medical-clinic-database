/* Drop tables and reinitialize */
DROP TABLE IF EXISTS Patient_EmergencyContacts;
DROP TABLE IF EXISTS Patient_FinancialInformation;
DROP TABLE IF EXISTS Patient_ContactInformation;
DROP TABLE IF EXISTS Patient;

/* Create the tables */
CREATE TABLE Patient (
	patient_id SERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender CHAR(1),
	created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50)
);

CREATE TABLE Patient_ContactInformation (
	patient_id SERIAL NOT NULL,
    address VARCHAR(50),
    phone_number VARCHAR(20),
	email VARCHAR(255),
	created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
	CONSTRAINT FK_Patient_ContactInformation_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id)
);

CREATE TABLE Patient_FinancialInformation (
	patient_id SERIAL NOT NULL,
	policy_number VARCHAR(50),
    group_number VARCHAR(50),
	created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
	CONSTRAINT FK_Patient_FinancialInformation_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id)
);

CREATE TABLE Patient_EmergencyContacts (
	patient_id SERIAL NOT NULL,
    contact_name VARCHAR(255) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    contact_relationship VARCHAR(50) NOT NULL,
	created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
	CONSTRAINT FK_Patient_EmergencyContacts_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id)
);

/* Example data insertion */
INSERT INTO Patient (first_name, middle_name, last_name, date_of_birth, gender) VALUES 
					('John', 'T.', 'Pham', CURDATE(), 'M');
                    
INSERT INTO Patient_ContactInformation (patient_id, address, phone_number, email) VALUES
					(1, 'University of Houston, Houston, TX', '911', 'john.pham@email.com');

INSERT INTO Patient_FinancialInformation (patient_Id, policy_number, group_number) VALUES
					(1, 'generic_policy_number', 'generic_group_number');

INSERT INTO Patient_EmergencyContacts (patient_Id, contact_name, contact_number, contact_relationship) VALUES
					(1, 'Joe Biden', '000-000-0000', 'President');

/* View the inserted information */
SELECT 
	P.patient_id,
    P.first_name,
    P.middle_name,
    P.last_name,
    P.date_of_birth,
    P.gender,
    CI.address,
    CI.phone_number,
    CI.email,
    II.policy_number,
    II.group_number
FROM Patient P
INNER JOIN Patient_ContactInformation CI ON P.patient_id = CI.patient_id
INNER JOIN Patient_FinancialInformation II ON P.patient_id = II.patient_id
GROUP BY P.patient_id;

SELECT * FROM Patient_EmergencyContacts EC WHERE EC.patient_id = 1;
