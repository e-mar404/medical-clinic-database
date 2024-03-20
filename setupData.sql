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
  ('patient1@gmail.com', '1234567890', '1 street dr'),
  ('patient2@gmail.com', '1234567890', '1 street dr'),
  ('patient3@gmail.com', '1234567890', '1 street dr'),
  ('patient4@gmail.com', '1234567890', '1 street dr');    

INSERT INTO
  Employee(email_address, primary_clinic, employee_type, employee_role, first_name, last_name) 
VALUES 
  ('doctor1@gmail.com', 1, 'medical', 'doctor', 'doctor', 'one'),
  ('doctor2@gmail.com', 2, 'medical', 'doctor', 'doctor', 'two');

INSERT INTO 
  Patient(email_address, first_name, last_name, date_of_birth, primary_doctor_id) 
Values 
  ('patient1@gmail.com', 'patient', 'one', DATE '2003-07-13', 1),
  ('patient2@gmail.com', 'patient', 'two', DATE '2003-07-13', 1),
  ('patient3@gmail.com', 'patient', 'three', DATE '2003-07-13', 2),
  ('patient4@gmail.com', 'patient', 'four', DATE '2003-07-13', 2);
