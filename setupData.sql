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
  Patient(email_address, first_name, last_name, date_of_birth, primary_doctor_id, gender) 
Values 
  ('patient1@gmail.com', 'patient', 'one', DATE '2003-07-13', 1, 'M'),
  ('patient2@gmail.com', 'patient', 'two', DATE '2003-07-13', 1, 'F'),
  ('patient3@gmail.com', 'patient', 'three', DATE '2003-07-13', 2, 'M'),
  ('patient4@gmail.com', 'patient', 'four', DATE '2003-07-13', 2, 'F');

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
	Patient_FinancialInformation (patient_id, name_on_card, card_number, cvv, expiration_date) 
VALUES
	(1, 'Gojo Satoru', '123-123-123-1234', '123', '06/24'),
	(1, 'John Pham', '999-999-999-9999', '567', '08/28');

INSERT INTO
  Referral(patient_id, doctor_id, reason_for_referral, expiration_date)
VALUES
  (1, 3, 'broken heart idk', Date '2024-05-01'),
  (2, 3, 'High blood pressure + pregnant', Date '2024-05-01');

INSERT INTO 
	Appointment(appointment_date, appointment_time, appointment_status, clinic_id, patient_id, doctor_id, confirmation)
VALUES 
	(DATE '2024-04-18', '14:00', 1, 1, 1, 1, 1),
  (DATE '2024-04-19', '15:00',1, 1, 2, 1, 1),
  (DATE '2024-04-17', '09:00', 1, 2, 3, 2, 1),
  (DATE '2024-04-17', '15:00',1, 1, 4, 1, 1);
