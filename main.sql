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

CREATE TABLE Patient (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    middle_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender CHAR(1),
    weight DECIMAL(5,2),
    home_address VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    insurance_policy_number VARCHAR(50),
    insurance_group_number VARCHAR(50),
    emergency_contact_name VARCHAR(255),
    emergency_contact_phone VARCHAR(20),
    emergency_contact_relationship VARCHAR(50),
);

CREATE TABLE MedicalHistory (
    history_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES Patient(patient_id),
    current_medications TEXT,
    allergies TEXT,
    past_surgeries TEXT,
    chronic_conditions TEXT,
    consent_forms TEXT,
    preferred_pharmacy VARCHAR(255),
    billing_info TEXT
);


CREATE TABLE Employee (
    employee_id SERIAL PRIMARY KEY,
    role VARCHAR(20),
    full_name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    gender CHAR(1),
    ssn VARCHAR(20),
    home_address VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    emergency_contact_name VARCHAR(255),
    emergency_contact_phone VARCHAR(20),
    emergency_contact_relationship VARCHAR(50),
    patients_assigned TEXT
);

CREATE TABLE Appointments (
    appointment_id SERIAL PRIMARY KEY,
    appointment_date TIMESTAMP,
    patient_id INT REFERENCES Patient(patient_id),
    clinic_id INT REFERENCES Clinic(clinic_id),
    doctor_id INT REFERENCES Employee(employee_id),
    confirmation BOOLEAN,
    status VARCHAR(20)
);

CREATE TABLE Medications (
    medication_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    contraindications TEXT
);
