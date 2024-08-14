# Set the default delimiter so the procedure can include semicolons
DELIMITER //

# Create the procedure
CREATE PROCEDURE add_int (IN x INT, IN y INT, OUT z INT)
BEGIN
  SELECT x + y INTO z;
END //

# Set the delimiter back to the default
DELIMITER ;

# Execute the stored procedure
CALL add_int (5, 3, @z);
# Return the output parameter
SELECT @z AS Result;

-- squared of number
delimiter //
create procedure squared (in x int, out result int)
begin
	select x*x into result;
end //
delimiter ;
call squared(3, @result);
select @result as squared;