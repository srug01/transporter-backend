CREATE DEFINER=`root`@`localhost` FUNCTION `GetBidNumber`() RETURNS varchar(250) CHARSET utf8
    READS SQL DATA
    DETERMINISTIC
BEGIN
declare returnVal varchar(250);
declare maxVal int;

Select  max(bidId) + 1 into maxVal from transporter.bid;
if maxVal is null then 
set maxVal:= 1;
end if;
SELECT concat('BID' , LPAD(maxVal, 8, '0')) into returnVal;
RETURN returnVal;
END