USE mdb;

INSERT INTO 
  Clinic(clinic_name) 
VALUES 
  ('clinic 1'),
  ('clinic 2');

INSERT INTO 
  ContactInformation(email_address, phone_number, address) 
VALUES
  ('doctor1@medc.org', '1234567890', '1 street dr'),
  ('doctor2@medc.org', '1234567890', '1 street dr'),
  ('nurse1@medc.org', '1234567890', '1 street dr'),
  ('nurse2@medc.org', '1234567890', '1 street dr'),
  ('specialist1@medc.org', '1234567890', '1 street dr'),
  ('specialist2@medc.org', '1234567890', '1 street dr'),
  ('admin1@medc.org', '1234567890', '1 street dr'),
  ('admin2@medc.org', '1234567890', '1 street dr'),
  ('receptionist1@medc.org', '1234567890', '1 street dr'),
  ('receptionist2@medc.org', '1234567890', '1 street dr'),
  ('patient1@gmail.com', '1234567890', '1 street dr'),
  ('patient2@gmail.com', '1234567890', '1 street dr'),
  ('patient3@gmail.com', '1234567890', '1 street dr'),
  ('patient4@gmail.com', '1234567890', '1 street dr');    

INSERT INTO
  Employee(email_address, primary_clinic, employee_type, employee_role, specialist, title, first_name, last_name) 
VALUES 
  ('doctor1@medc.org', 1, 'medical', 'doctor', false, 'Family Doctor', 'Doctor', 'One'),
  ('doctor2@medc.org', 2, 'medical', 'doctor', false, 'Family Doctor', 'Doctor', 'Two'),
  ('specialist1@medc.org', 1, 'medical', 'doctor', true, 'Cardiologist', 'Specialist', 'One'),
  ('specialist2@medc.org', 2, 'medical', 'doctor', true, 'Dermatologist', 'Specialist', 'Two'),
  ('admin1@medc.org', 1, 'staff', 'administrator', false, 'Manager', 'Admin', 'One'),
  ('admin2@medc.org', 2, 'staff', 'administrator', false, 'Manager', 'Admin', 'Two'),
  ('receptionist1@medc.org', 1, 'staff', 'receptionist', false, 'Receptionist', 'Front', 'Office1'),
  ('receptionist2@medc.org', 2, 'staff', 'receptionist', false, 'Receptionist', 'Front', 'Office2'),
  ('nurse1@medc.org', 1, 'medical', 'nurse', false, 'NP', 'Nurse', 'One'),
  ('nurse2@medc.org', 2, 'medical', 'nurse', false, 'NP', 'Nurse', 'Two');


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
  ('doctor1@medc.org', 'password', 1),
  ('doctor2@medc.org', 'password', 2),
  ('specialist1@medc.org', 'password', 3),
  ('specialist2@medc.org', 'password', 4),
  ('admin1@medc.org', 'password', 5),
  ('admin2@medc.org', 'password', 6),
  ('receptionist1@medc.org', 'password', 7),
  ('receptionist2@medc.org', 'password', 8),
  ('nurse1@medc.org', 'password', 9),
  ('nurse2@medc.org', 'password', 10);

INSERT INTO
  Patient_Login(email_address, password, patient_id)
VALUES
  ('patient1@gmail.com', 'password', 1),
  ('patient2@gmail.com', 'password', 2),
  ('patient3@gmail.com', 'password', 3),
  ('patient4@gmail.com', 'password', 4);

INSERT INTO
  Referral(patient_id, doctor_id,  expiration_date)
VALUES
  (1, 3, Date '2024-05-01'),
  (2, 3, Date '2024-05-01');
