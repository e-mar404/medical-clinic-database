CREATE DATABASE Medical_Clinic();

CREATE TABLE Company (
  company_id SERIAL PRIMARY KEY, 
  name VARCHAR(255) NOT NULL, 
  street_address VARCHAR(255), 
  city VARCHAR(255), 
  state VARCHAR(255), 
  zip_code VARCHAR(10), 
  phone_number VARCHAR(20)
);

CREATE TABLE Clinic (
  clinic_id SERIAL PRIMARY KEY, 
  name VARCHAR(255), 
  street_address VARCHAR(255), 
  city VARCHAR(255), 
  state VARCHAR(255), 
  zip_code VARCHAR(10), 
  phone_number VARCHAR(20)
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

CREATE TABLE MedicalHistory (
  history_id SERIAL PRIMARY KEY, 
  current_medications TEXT, 
  allergies TEXT, 
  past_surgeries TEXT, 
  chronic_conditions TEXT, 
  consent_forms TEXT, 
  preferred_pharmacy VARCHAR(255), 
  billing_info TEXT
);

CREATE TABLE Appointments (
  appointment_id SERIAL PRIMARY KEY, 
  appointment_date TIMESTAMP, 
  confirmation BOOLEAN, 
  status VARCHAR(20)
);

CREATE TABLE Medications (
  medication_id SERIAL PRIMARY KEY, 
  name VARCHAR(255), 
  contraindications TEXT
);
