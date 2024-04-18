DELIMITER //
CREATE EVENT CancelNoShowAppointments 
ON SCHEDULE EVERY 10 SECOND
DO
BEGIN
  CALL check_for_no_show_appointments('9:00', '20:00');
END; //
