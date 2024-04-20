DELIMITER //
CREATE EVENT CancelNoShowAppointments 
ON SCHEDULE EVERY 15 MINUTE
DO
BEGIN
  CALL check_for_no_show_appointments('9:00', '17:30');
END; //
