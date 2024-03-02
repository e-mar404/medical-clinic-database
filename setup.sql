DROP DATABASE IF EXISTS mdb;
CREATE DATABASE mdb;
USE mdb;

/* Drop tables and reinitialize */
DROP TABLE IF EXISTS Medication;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS MEmployee;
DROP TABLE IF EXISTS SEmployee;
DROP TABLE IF EXISTS Patient_MedicalHistory;
DROP TABLE IF EXISTS Patient_MedicalProcedure;
DROP TABLE IF EXISTS Patient_EmergencyContacts;
DROP TABLE IF EXISTS Patient_FinancialInformation;
DROP TABLE IF EXISTS Patient_InsuranceInformation;
DROP TABLE IF EXISTS Patient_ContactInformation;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS ContactInformation;
DROP TABLE IF EXISTS ManagedBy;
DROP TABLE IF EXISTS Clinic;
DROP TABLE IF EXISTS Company;

/* Base Tables */
CREATE TABLE ContactInformation (
    email_address VARCHAR(50) NOT NULL PRIMARY KEY,
    phone_number VARCHAR(20),
    address VARCHAR(50),
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50)
);

CREATE TABLE Company (
    company_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(50) NOT NULL,
	address VARCHAR(50),
    phone_number VARCHAR(50),
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50)
);

CREATE TABLE Clinic (
    clinic_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    clinic_name VARCHAR(50) NOT NULL,
	address VARCHAR(50),
    phone_number VARCHAR(20),
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50)
);

CREATE TABLE ManagedBy (
    company_id INT NOT NULL,
    clinic_id INT NOT NULL,
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
    CONSTRAINT FK_ManagedBy_company_id FOREIGN KEY (company_id) REFERENCES Company (company_id),
    CONSTRAINT FK_ManagedBy_clinic_id FOREIGN KEY (clinic_id) REFERENCES Clinic (clinic_id),
    CONSTRAINT UC_ManagedBy_company_id_clinic_id UNIQUE (company_id, clinic_id)
);

/* Employee Tables */
CREATE TABLE MEmployee (
    memployee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
    semployee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
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

/* Patient Tables */
CREATE TABLE Patient (
    patient_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
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

CREATE TABLE Patient_MedicalHistory (
	patient_id INT NOT NULL,
    conditions TEXT,
    allergies TEXT,
    family_history TEXT,
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
    CONSTRAINT FK_Patient_MedicalHistory_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    CONSTRAINT UC_Patient_MedicalHistory_patient_id UNIQUE (patient_id)
);

CREATE TABLE Patient_MedicalProcedure (
	procedure_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	patient_id INT NOT NULL,
	doctor_id INT NOT NULL,
    procedure_date DATE NOT NULL,
    procedure_description TEXT NOT NULL,
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
    CONSTRAINT FK_Patient_MedicalProcedure_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    CONSTRAINT FK_Patient_MedicalProcedure_doctor_id FOREIGN KEY (patient_id) REFERENCES MEmployee (memployee_id)
);

CREATE TABLE Patient_InsuranceInformation (
    patient_id INT NOT NULL,
    policy_number VARCHAR(50),
    group_number VARCHAR(50),
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
    CONSTRAINT FK_Patient_InsuranceInformation_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    CONSTRAINT UC_Patient_InsuranceInformation_patient_id UNIQUE (patient_id)
);

CREATE TABLE Patient_FinancialInformation (
    patient_id INT NOT NULL,
    name_on_card VARCHAR(50) NOT NULL,
    card_number VARCHAR(50) NOT NULL,
    cvv VARCHAR(50) NOT NULL,
    expiration_date DATE NOT NULL,
	created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
    CONSTRAINT FK_Patient_FinancialInformation_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id)
);

CREATE TABLE Patient_EmergencyContacts (
    patient_id INT NOT NULL,
    contact_name VARCHAR(255) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    contact_relationship VARCHAR(50) NOT NULL,
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
    CONSTRAINT FK_Patient_EmergencyContacts_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id)
);

/* Supporting Tables */
CREATE TABLE Appointment (
	appointment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    appointment_date DATE NOT NULL,
    appointment_status ENUM('scheduled', 'in_progress', 'past', 'canceled') NOT NULL,
    clinic_id INT NOT NULL, 
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    confirmation SMALLINT,
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
    CONSTRAINT FK_Appointment_clinic_id FOREIGN KEY (clinic_id) REFERENCES Clinic (clinic_id),
    CONSTRAINT FK_Appointment_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    CONSTRAINT FK_Appointment_doctor_id FOREIGN KEY (doctor_id) REFERENCES MEmployee (memployee_id)
);

CREATE TABLE Medication (
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    medication_name VARCHAR(50),
    medication_date DATE NOT NULL,
    procedure_id INT,
	created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
    CONSTRAINT FK_Medication_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    CONSTRAINT FK_Medication_doctor_id FOREIGN KEY (doctor_id) REFERENCES MEmployee (memployee_id),
    CONSTRAINT FK_Medication_procedure_id FOREIGN KEY (procedure_id) REFERENCES Patient_MedicalProcedure (procedure_id)
);
