USE CLINIC_DB;

ALTER TABLE Appointment
ADD CONSTRAINT Fk_patient_id
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
ADD CONSTRAINT Fk_doctor_id

    FOREIGN KEY (doctor_id) REFERENCES MEmployee(employee_id),
ADD CONSTRAINT Fk_clinic_id 
    FOREIGN KEY (clinic_id) REFERENCES Clinic(clinic_id);
   


ALTER TABLE Patient_InsuranceInformation
ADD CONSTRAINT FK_Patient_InsuranceInformation_patient_id 
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id);

ALTER TABLE Patient_FinancialInformation
ADD CONSTRAINT FK_Patient_FinancialInformation_patient_id 
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id);

ALTER TABLE Patient_EmergencyContacts
ADD CONSTRAINT FK_Patient_EmergencyContacts_patient_id 
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id);

ALTER TABLE MedicalHistory
ADD PRIMARY KEY (patient_id, date);

ALTER TABLE Medication 
ADD PRIMARY KEY (patient_id, doctor_id, date);
>>>>>>> 6f7ad73 (added tables to setup.sql)
