CREATE DEFINER=`root`@`localhost` PROCEDURE `count_procedure`(OUT cnt INT)
BEGIN
select COUNT(*) into cnt from product;

END