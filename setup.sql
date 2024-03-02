-- Reinizialize clinic_db
DROP DATABASE IF EXISTS CLINIC_DB;

CREATE DATABASE CLINIC_DB;

-- this is only needed in case the db is not selected from the workbench or from the cli mysql tool
USE CLINIC_DB;

-- Drop tables and reinitialize
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS MEmployee;
DROP TABLE IF EXISTS SEmployee;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Patient_InsuranceInformation;
DROP TABLE IF EXISTS Patient_FinancialInformation;
DROP TABLE IF EXISTS Patient_EmergencyContacts;
DROP TABLE IF EXISTS ContactInformation;
DROP TABLE IF EXISTS MedicalHistory;
DROP TABLE IF EXISTS Medication;

CREATE TABLE Patient(
    patient_id BINARY(16) NOT NULL PRIMARY KEY,
    email_address VARCHAR(50) NOT NULL, 
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender CHAR(1),
    -- Insurance info
    -- Financial info
    -- Personal contact
    -- Emergency contact
    -- Preferred pharmacy
    -- Consent form
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50)
);

CREATE TABLE MEmployee (
    employee_id BINARY(16) NOT NULL PRIMARY KEY,
    email_address VARCHAR(50) NOT NULL,
    employee_role ENUM ('Doctor', 'Nurse'),
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50)
);

CREATE TABLE SEmployee (
    employee_id BINARY(16) NOT NULL PRIMARY KEY,
    email_address VARCHAR(50) NOT NULL,
    employee_role ENUM ('Receptionist', 'Administrator'),
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50)
);

CREATE TABLE Appointment (
    date DATE NOT NULL,
    patient_id BINARY(16),
    doctor_id BINARY(16),
    clinic_id BINARY(16), 
    confirmation SMALLINT,
    status ENUM('scheduled', 'in_progress', 'past', 'canceled'),
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50)
);

CREATE TABLE Clinic(
    clinic_id binary(16) NOT NULL PRIMARY KEY,
    name VARCHAR(50)
    -- Location
    -- Contact
);

<<<<<<< HEAD
CREATE TABLE Company(
    company_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50)
    -- contact
);
=======

CREATE TABLE Patient_InsuranceInformation (
    patient_id BINARY(16),
    insurance_name VARCHAR(50),
    policy_number VARCHAR(50),
    group_number VARCHAR(50),
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50)
);

CREATE TABLE Patient_FinancialInformation (
    patient_id BINARY(16),
    --card_id
    name_on_card VARCHAR(50) NOT NULL,
    card_number VARCHAR(50) NOT NULL,
    cvv VARCHAR(50) NOT NULL,
    expiration_date DATE NOT NULL,
    zipcode INT
);

CREATE TABLE Patient_EmergencyContacts (
    patient_id BINARY(16),
    contact_name VARCHAR(255) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    contact_relationship VARCHAR(50) NOT NULL,
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50)
);

CREATE TABLE ContactInformation (
    email_address VARCHAR(50) NOT NULL PRIMARY KEY,
    phone_number VARCHAR(20),
    address VARCHAR(50),
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50)
);

CREATE TABLE MedicalHistory (
    patient_id BINARY(16),
    date DATE NOT NULL,
    --history_id SERIAL PRIMARY KEY, 
    current_medications TEXT, 
    allergies TEXT, 
    weight INT,
    past_surgeries TEXT, 
    chronic_conditions TEXT 
    --consent_forms TEXT, 
    --preferred_pharmacy VARCHAR(255), 
    --billing_info TEXT
);

CREATE TABLE Medication (
    patient_id BINARY(16),
    doctor_id BINARY(16),
    medication_name VARCHAR(50),
    date DATE NOT NULL
);
>>>>>>> 180bfa9d01ce68e0180aa70ee53e3d01340d1c26
