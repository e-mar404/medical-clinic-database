use mdb;

\! echo 'All Appointment Views';
select * from all_appointments;

\! echo 'Doctors and their patients';
select * from primary_doctor_for_patient;

\! echo 'Clinic employees work at';
select * from primary_clinic_for_employee;

\! echo 'Number of patients at each clinic';
select * from num_patients_at_clinic;
