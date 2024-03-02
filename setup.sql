-- Create schema/database to put tables into, need to do use db to not require dot notation
CREATE DATABASE IF NOT EXISTS CLINIC;
USE CLINIC;

-- Drop tables and reinitialize
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS MEmployee;
DROP TABLE IF EXISTS SEmployee;
DROP TABLE IF EXISTS Appointment;

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
    clinicId BINARY(16),
    confirmation SMALLINT,
    status ENUM('scheduled', 'in_progress', 'past', 'canceled'),
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50)
);
