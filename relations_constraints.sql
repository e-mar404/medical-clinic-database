USE CLINIC_DB;

ALTER TABLE Appointment
ADD CONSTRAINT Fk_patient_id
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
ADD CONSTRAINT Fk_doctor_id
    FOREIGN KEY (doctor_id) REFERENCES MEmployee(employee_id),
ADD CONSTRAINT Fk_clinic_id 
    FOREIGN KEY (clinic_id) REFERENCES Clinic(clinic_id);
