DELIMITER //
CREATE EVENT CancelNoShowAppointments 
ON SCHEDULE EVERY 1 HOUR 
DO
BEGIN
  CALL check_for_no_show_appointments('9:00', '17:00');
END; //
