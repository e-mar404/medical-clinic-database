INSERT INTO 
  Clinic(clinic_name) 
VALUES 
  ('Clinic (Houston-Downtown)'),
  ('Clinic (Houston-Pearland)');

INSERT INTO 
  ContactInformation(email_address, phone_number, address) 
VALUES
  ('lmckinney@medc.org', '1234567890', '1 street dr'),
  ('szalman@medc.org', '1234567890', '1 street dr'),
  ('mclavin@medc.org', '1234567890', '1 street dr'),
  ('dpoiltzer@medc.org', '1234567890', '1 street dr'),
  ('eelbadawi@medc.org', '1234567890', '1 street dr'),
  ('swong@medc.org', '1234567890', '1 street dr'),
  ('uramamurthy@medc.org', '1234567890', '1 street dr'),
  ('nshepley@medc.org', '1234567890', '1 street dr'),
  ('drodrigues@gmail.com', '1234567890', '1 street dr'),
  ('jbailey@medc.org', '1234567890', '1 street dr'),
  ('emarin@gmail.com', '1234567890', '1 street dr'),
  ('btuason@gmail.com', '1234567890', '1 street dr'),
  ('yrodriguez@gmail.com', '1234567890', '1 street dr'),
  ('mzaker@medc.org', '1234567890', '1 street dr');    

INSERT INTO
  Employee(email_address, primary_clinic, employee_type, employee_role, specialist, title, first_name, last_name) 
VALUES 
  ('lmckinney@medc.org', 1, 'medical', 'doctor', false, 'Family Doctor', 'Lyle', 'McKinney'),
  ('szalman@medc.org', 2, 'medical', 'doctor', false, 'Family Doctor', 'Sandra', 'Zalman'),
  ('eelbadawi@medc.org', 1, 'medical', 'doctor', true, 'Cardiologist', 'Emran', 'El-Badawi'),
  ('swong@medc.org', 2, 'medical', 'doctor', true, 'Dermatologist', 'Sissy', 'Wong'),
  ('uramamurthy@medc.org', 1, 'staff', 'administrator', false, 'Manager', 'Uma', 'Ramamurthy'),
  ('nshepley@medc.org', 2, 'staff', 'administrator', false, 'Manager', 'Nathan', 'Shepley'),
  ('mzaker@medc.org', 1, 'staff', 'receptionist', false, 'Receptionist', 'Mohammad', 'Zaker'),
  ('jbailey@medc.org', 2, 'staff', 'receptionist', false, 'Receptionist', 'Jeremy', 'Bailey'),
  ('mclavin@medc.org', 1, 'medical', 'nurse', false, 'NP', 'Matt', 'Clavin'),
  ('dpoiltzer@medc.org', 2, 'medical', 'nurse', false, 'NP', 'David', 'Poiltzer');

INSERT INTO 
  Patient(email_address, first_name, last_name, date_of_birth, primary_doctor_id, gender) 
Values 
  ('emarin@gmail.com', 'Emilio', 'Marin', DATE '2003-07-13', 1, 'M'),
  ('btuason@gmail.com', 'Ben', 'Tuason', DATE '2003-07-13', 1, 'M'),
  ('yrodriguez@gmail.com', 'Yesenia', 'Rodriguez', DATE '2003-07-13', 2, 'F'),
  ('drodrigues@gmail.com', 'Debra', 'Rodrigues', DATE '2003-07-13', 2, 'F');

INSERT INTO
  Employee_Login(email_address, password, employee_id)
VALUES
  ('lmckinney@medc.org', 'password', 1),
  ('szalman@medc.org', 'password', 2),
  ('eelbadawi@medc.org', 'password', 3),
  ('swong@medc.org', 'password', 4),
  ('uramamurthy@medc.org', 'password', 5),
  ('nshepley@medc.org', 'password', 6),
  ('mzaker@medc.org', 'password', 7),
  ('jbailey@medc.org', 'password', 8),
  ('mclavin@medc.org', 'password', 9),
  ('dpoiltzer@medc.org', 'password', 10);

INSERT INTO
  Patient_Login(email_address, password, patient_id)
VALUES
  ('emarin@gmail.com', 'password', 1),
  ('btuason@gmail.com', 'password', 2),
  ('yrodriguez@gmail.com', 'password', 3),
  ('drodrigues@gmail.com', 'password', 4);

INSERT INTO 
	Patient_FinancialInformation (patient_id, name_on_card, card_number, cvv, expiration_date) 
VALUES
	(1, 'Gojo Satoru', '123-123-123-1234', '123', '06/24'),
	(1, 'John Pham', '999-999-999-9999', '567', '08/28');

INSERT INTO 
  Patient_InsuranceInformation (patient_id, policy_number, group_number)
VALUES 
  (1, 123456789, 000123456789);

INSERT INTO
  Referral(patient_id, doctor_id, reason_for_referral, expiration_date)
VALUES
  (1, 3, 'had heart attack 2 weeks ago', Date '2024-05-01'),
  (2, 4, 'Ezcema', Date '2024-05-01');

INSERT INTO 
	Appointment(appointment_date, appointment_time, appointment_status, clinic_id, patient_id, doctor_id, confirmation)
VALUES 
  (DATE '2024-04-19', '15:00', 'scheduled', 1, 2, 1, 1),
  (DATE '2024-04-17', '09:00', 'no show', 2, 3, 2, 1),
  (DATE '2024-04-17', '15:00', 'complete', 1, 4, 1, 1);
