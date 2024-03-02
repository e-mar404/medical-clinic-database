-- Reinizialize clinic_db
DROP DATABASE IF EXISTS CLINIC_DB;

CREATE DATABASE CLINIC_DB;

-- this is only needed in case the db is not selected from the workbench or from the cli mysql tool
USE CLINIC_DB;

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
