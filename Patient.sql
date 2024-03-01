/* Drop tables and reinitialize */
DROP TABLE IF EXISTS Patient_EmergencyContacts;
DROP TABLE IF EXISTS Patient_FinancialInformation;
DROP TABLE IF EXISTS Patient_InsuranceInformation;
DROP TABLE IF EXISTS Patient_ContactInformation;
DROP TABLE IF EXISTS Patient;

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

CREATE TABLE Patient_InsuranceInformation (
	patient_id SERIAL NOT NULL,
	policy_number VARCHAR(50),
    group_number VARCHAR(50),
	created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
	CONSTRAINT FK_Patient_InsuranceInformation_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id)
);

CREATE TABLE Patient_FinancialInformation (
	patient_id SERIAL NOT NULL,
    name_on_card VARCHAR(50) NOT NULL,
    card_number VARCHAR(50) NOT NULL,
    cvv VARCHAR(50) NOT NULL,
    expiration_date DATE NOT NULL,
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

INSERT INTO Patient (first_name, middle_name, last_name, date_of_birth, gender) VALUES 
					('John', 'T.', 'Pham', CURDATE(), 'M');
                    
INSERT INTO Patient_ContactInformation (patient_id, address, phone_number, email) VALUES
					(1, 'University of Houston, Houston, TX', '911', 'john.pham@email.com');

INSERT INTO Patient_InsuranceInformation (patient_Id, policy_number, group_number) VALUES
					(1, 'generic_policy_number', 'generic_group_number');

INSERT INTO Patient_FinancialInformation (patient_id, name_on_card, card_number, cvv, expiration_date) VALUES
					(1, 'John Pham', 'card_number', 'cvv', CURDATE());

INSERT INTO Patient_EmergencyContacts (patient_Id, contact_name, contact_number, contact_relationship) VALUES
					(1, 'Joe Biden', '000-000-0000', 'President');

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
    II.group_number,
    FI.card_number,
    FI.cvv
FROM Patient P
INNER JOIN Patient_ContactInformation CI ON P.patient_id = CI.patient_id
INNER JOIN Patient_InsuranceInformation II ON P.patient_id = II.patient_id
INNER JOIN Patient_FinancialInformation FI ON P.patient_id = FI.patient_id;

SELECT * FROM Patient_EmergencyContacts EC WHERE EC.patient_id = 1;
