/* Drop tables and reinitialize */
DROP TABLE IF EXISTS ContactInformtion;
DROP TABLE IF EXISTS MEmployee;
DROP TABLE IF EXISTS SEmployee;
DROP TABLE IF EXISTS Patient_EmergencyContacts;
DROP TABLE IF EXISTS Patient_FinancialInformation;
DROP TABLE IF EXISTS Patient_InsuranceInformation;
DROP TABLE IF EXISTS Patient_ContactInformation;
DROP TABLE IF EXISTS Patient;

CREATE TABLE ContactInformation (
    email_address VARCHAR(50) NOT NULL PRIMARY KEY,
    phone_number VARCHAR(20),
	address VARCHAR(50),
	created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50)
);

CREATE TABLE MEmployee (
	employee_id SERIAL NOT NULL PRIMARY KEY,
    email_address VARCHAR(50) NOT NULL,
    employee_role ENUM ('Doctor', 'Nurse'),
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
	created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
	CONSTRAINT FK_MEmployee_email_address FOREIGN KEY (email_address) REFERENCES ContactInformation (email_address)
);

CREATE TABLE SEmployee (
	employee_id SERIAL NOT NULL PRIMARY KEY,
    email_address VARCHAR(50) NOT NULL,
    employee_role ENUM ('Receptionist', 'Administrator'),
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
	created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
	CONSTRAINT FK_SEmployee_email_address FOREIGN KEY (email_address) REFERENCES ContactInformation (email_address)
);

CREATE TABLE Patient (
	patient_id SERIAL NOT NULL PRIMARY KEY,
    email_address VARCHAR(50) NOT NULL, 
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender CHAR(1),
	created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
	CONSTRAINT FK_Patient_email_address FOREIGN KEY (email_address) REFERENCES ContactInformation (email_address)
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
