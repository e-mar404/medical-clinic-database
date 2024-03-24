USE mdb;

INSERT INTO 
  Clinic(clinic_name) 
VALUES 
  ('clinic 1'),
  ('clinic 2');

INSERT INTO 
  ContactInformation(email_address, phone_number, address) 
VALUES
  ('doctor1@gmail.com', '1234567890', '1 street dr'),
  ('doctor2@gmail.com', '1234567890', '1 street dr'),
  ('admin1@gmail.com', '1234567890', '1 street dr'),
  ('admin2@gmail.com', '1234567890', '1 street dr'),
  ('patient1@gmail.com', '1234567890', '1 street dr'),
  ('patient2@gmail.com', '1234567890', '1 street dr'),
  ('patient3@gmail.com', '1234567890', '1 street dr'),
  ('patient4@gmail.com', '1234567890', '1 street dr');    

INSERT INTO
  Employee(email_address, primary_clinic, employee_type, employee_role, first_name, last_name) 
VALUES 
  ('doctor1@gmail.com', 1, 'medical', 'doctor', 'doctor', 'one'),
  ('doctor2@gmail.com', 2, 'medical', 'doctor', 'doctor', 'two'),
  ('admin1@gmail.com', 1, 'staff', 'administrator', 'admin', 'one'),
  ('admin2@gmail.com', 1, 'staff', 'administratr', 'admin', 'one');

INSERT INTO 
  Patient(email_address, first_name, last_name, date_of_birth, primary_doctor_id) 
Values 
  ('patient1@gmail.com', 'patient', 'one', DATE '2003-07-13', 1),
  ('patient2@gmail.com', 'patient', 'two', DATE '2003-07-13', 1),
  ('patient3@gmail.com', 'patient', 'three', DATE '2003-07-13', 2),
  ('patient4@gmail.com', 'patient', 'four', DATE '2003-07-13', 2);

INSERT INTO
  Employee_Login(email_address, password, employee_id)
VALUES
  ('doctor1@gmail.com', 'password', 1),
  ('admin1@gmail.com', 'password', 1),
  ('admin2@gmail.com', 'password', 2),
  ('doctor2@gmail.com', 'password', 2);

INSERT INTO
  Patient_Login(email_address, password, patient_id)
VALUES
  ('patient1@gmail.com', 'password', 1),
  ('patient2@gmail.com', 'password', 2),
