DROP DATABASE IF EXISTS mdb;
CREATE DATABASE mdb;
USE mdb;

SET GLOBAL time_zone = '-05:00';
SET SESSION time_zone ='-05:00';

/* Drop tables and reinitialize */
DROP TABLE IF EXISTS Medication;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Employee;
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
CREATE TABLE Employee (
    employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email_address VARCHAR(50) NOT NULL,
    primary_clinic INT,
    employee_type ENUM('Medical', 'Staff'), 
    employee_role ENUM ('Doctor', 'Nurse', 'Receptionist', 'Administrator'),
    specialist BOOL DEFAULT FALSE,
    title VARCHAR(50),
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
    CONSTRAINT FK_Employee_email_address FOREIGN KEY (email_address) REFERENCES ContactInformation (email_address),
    CONSTRAINT FK_Employee_primary_clinic FOREIGN KEY (primary_clinic) REFERENCES Clinic (clinic_id)
);

CREATE TABLE Employee_Login (
  email_address VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  employee_id INT NOT NULL,
  CONSTRAINT FK_Employee_Login_employee_id FOREIGN KEY (employee_id) REFERENCES Employee (employee_id),
  CONSTRAINT FK_Employee_Login_email_address FOREIGN KEY (email_address) REFERENCES ContactInformation (email_address)
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
    primary_doctor_id INT,
    created DATE,
    createdby VARCHAR(50),
    updated DATE,
    updatedby VARCHAR(50),
    CONSTRAINT FK_Patient_email_address FOREIGN KEY (email_address) REFERENCES ContactInformation (email_address),
    CONSTRAINT FK_Patient_primary_doctor_id FOREIGN KEY (primary_doctor_id) REFERENCES Employee (employee_id)
);

CREATE TABLE Patient_Login (
  email_address VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  patient_id INT NOT NULL,
  CONSTRAINT FK_Patient_Login_email_address FOREIGN KEY (email_address) REFERENCES ContactInformation (email_address),
  CONSTRAINT FK_Patient_Login_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id)
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
  CONSTRAINT FK_Patient_MedicalProcedure_doctor_id FOREIGN KEY (doctor_id) REFERENCES Employee (employee_id)
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
    CONSTRAINT FK_Patient_FinancialInformation_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    CONSTRAINT UC_Patient_FinancialInformation_patient_id UNIQUE (patient_id)
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
    CONSTRAINT FK_Patient_EmergencyContacts_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    CONSTRAINT UC_Patient_EmergencyContacts_patient_id UNIQUE (patient_id)
);

/* Supporting Tables */
CREATE TABLE Appointment (
  appointment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  appointment_date DATE NOT NULL,
  appointment_status ENUM('scheduled', 'past', 'cancelled') NOT NULL,
  clinic_id INT NOT NULL, 
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  appointment_time TIME NOT NULL,
  confirmation SMALLINT,
  created DATE,
  createdby VARCHAR(50),
  updated DATE,
  updatedby VARCHAR(50),
  CONSTRAINT FK_Appointment_clinic_id FOREIGN KEY (clinic_id) REFERENCES Clinic (clinic_id),
  CONSTRAINT FK_Appointment_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
  CONSTRAINT FK_Appointment_doctor_id FOREIGN KEY (doctor_id) REFERENCES Employee (employee_id)
);

CREATE TABLE Medication (
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  medication_name VARCHAR(50),
  medication_date DATE NOT NULL,
  created DATE,
  createdby VARCHAR(50),
  updated DATE,
  updatedby VARCHAR(50),
  CONSTRAINT FK_Medication_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
  CONSTRAINT FK_Medication_doctor_id FOREIGN KEY (doctor_id) REFERENCES Employee (employee_id)
);

CREATE TABLE Referral (
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  expiration_date DATE,
  CONSTRAINT FK_Referral_patient_id FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
  CONSTRAINT FK_Referral_doctor_id FOREIGN KEY (doctor_id) REFERENCES Employee (employee_id)
);

/* Views */
CREATE VIEW all_appointments(appintment_date, doctor_fname, doctor_lname, patient_fname, patient_lname)
AS (
  SELECT A.appointment_date, D.first_name, D.last_name, P.first_name, P.last_name
  FROM Appointment AS A, Employee AS D, Patient AS P
  WHERE A.doctor_id=D.employee_id AND A.patient_id=P.patient_id
  ORDER BY A.appointment_date 
);

CREATE VIEW primary_doctor_for_patient(doctor_id, doctor_fname, doctor_lname, patient_id, patient_fname, patient_lname) 
AS (
	SELECT  D.employee_id, D.first_name, D.last_name, P.patient_id, P.first_name, P.last_name
  FROM Employee AS D, Patient AS P
  WHERE D.employee_id=P.primary_doctor_id
);

CREATE VIEW primary_clinic_for_employee(clinic_id, clinc_name, employee_fname, employee_lname)
AS (
  SELECT C.clinic_id, C.clinic_name, E.first_name, E.last_name
  FROM Clinic AS C, Employee AS E
  WHERE C.clinic_id=E.primary_clinic
);

CREATE VIEW num_patients_at_clinic(clinic_id, clinic_name, number_of_patients)
AS (
  SELECT C.clinic_id, C.clinic_name, COUNT(*)
  FROM Clinic as C
  RIGHT OUTER JOIN (
    SELECT P.patient_id AS p_id, C.clinic_id AS c_id
    FROM Clinic AS C, Patient AS P, Employee AS D
    WHERE P.primary_doctor_id=D.employee_id AND D.primary_clinic=C.clinic_id
  ) patient_list ON C.clinic_id=patient_list.c_id
  GROUP BY C.clinic_id
);
