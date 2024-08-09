


DELIMITER //
CREATE FUNCTION AmountCustomer7 (p_customer_id INT) RETURNS decimal(5,2)
    DETERMINISTIC
BEGIN

  DECLARE mySum DECIMAL(5,2);    

	SELECT 	SUM(amount) into mySUM
	FROM payment
	WHERE customer_id = p_customer_id;

  RETURN mySUM;wert
END //
DELIMITER ;

select uuid();

Select AmountCustomer3(199);