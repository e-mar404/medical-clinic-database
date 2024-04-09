DELIMITER //
CREATE PROCEDURE check_for_no_show_appointments()
BEGIN
	UPDATE Appointment
  SET appointment_status='cancelled'
  WHERE 
	 appointment_date=CURDATE() AND
   HOUR(appointment_time)=HOUR(CURTIME());
END; //
