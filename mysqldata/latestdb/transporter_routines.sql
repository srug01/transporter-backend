-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: transporter
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping events for database 'transporter'
--

--
-- Dumping routines for database 'transporter'
--
/*!50003 DROP FUNCTION IF EXISTS `FuncGetBidCutofftime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FuncGetBidCutofftime`(StartDate datetime, IsFullTime int , hours int) RETURNS varchar(30) CHARSET utf8
    READS SQL DATA
    DETERMINISTIC
BEGIN
declare CutOffTime varchar(30);
declare starthour int;
declare endhour int;
declare dateaddition int default 0 ;
 select  HOUR(StartDate) into starthour;
 
 if(hours < 8) then
	 if(starthour between 10 and 18) then
					if((18 - starthour) > 5) then
					  select DATE_ADD(StartDate, INTERVAL hours hour)  into CutOffTime;
                      end if;
                      if((18 - starthour) < 6) then
					  select DATE_ADD(StartDate, INTERVAL((18 - starthour) + 16 + (6 - (18 - starthour))) hour)  into CutOffTime;
                      end if;
				else if(starthour < 10) then
					select DATE_ADD(StartDate, INTERVAL (hours + (10 - starthour )) hour) into CutOffTime;
				else if(starthour > 18) then
					select DATE_ADD(StartDate, INTERVAL (hours + 10 + (24 - starthour )) hour) into CutOffTime;
			end if;  
		end if; 
		end if;
  end if;   
    
    
 -- odd hours
if(IsFullTime = 0) 
	then
		 if(starthour between 10 and 18) then
				  select DATE_ADD(StartDate, INTERVAL hours hour)  into CutOffTime;
			else if(starthour < 10) then
				select DATE_ADD(StartDate, INTERVAL (hours + (10 - starthour )) hour) into CutOffTime;
			else if(starthour > 18) then
				select DATE_ADD(StartDate, INTERVAL (hours + 10 + (24 - starthour )) hour) into CutOffTime;
		end if;  
	end if; 
    end if;
end if;
-- full hors divided by 24
if(IsFullTime = 1) 
    then
			if(starthour between 11 and 18) then
				select DATE_ADD(StartDate, INTERVAL hours hour)  into CutOffTime; -- 42,12 hours
			else if(starthour < 11) then
				select DATE_ADD(StartDate, INTERVAL (hours - 16 + (10 - starthour )) hour)  into CutOffTime; -- 42,12 hours
            else if(starthour > 18) then
				select DATE_ADD(StartDate, INTERVAL (hours -  (starthour  - 18)) hour)  into CutOffTime; -- 42,12 hours    
                 
			end if;
	end if; 
	end if;
   end if;
   
   RETURN CutOffTime;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetBidNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllBids` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllBids`(IN OrderId int )
BEGIN

Select * from transporter2.bid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllCFSbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSbyUserId`(in user_Id int)
BEGIN

Select cm.* from transporter.cfsmaster cm
Inner Join transporter.cfsuserregistration cur on cm.cfsMasterId = cur.cfsMasterId
Where cur.userId =  user_Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllCFSContainersbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCFSContainersbyUserId`(in user_Id int, in type_Id int, in port_yard_Id int)
BEGIN

IF (type_Id = 1) Then -- CFS To Yard
Select distinct  c.* from transporter.containermaster c
Inner Join transporter.cfsyardratemaster yrm on c.containerMasterId = yrm.containerMasterId
Inner Join transporter.cfsuserregistration cur on yrm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and yrm.yardMasterId = port_yard_Id;

ELSEIF (type_Id = 2)  Then -- CFS To Port
Select distinct c.* from transporter.containermaster c
Inner Join transporter.cfsportratemaster crm on c.containerMasterId = crm.containerMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and crm.portMasterId = port_yard_Id;

ELSEIF (type_Id = 3)  Then -- Yard To CFS
Select distinct c.* from transporter.containermaster c
Inner Join transporter.yardcfsratemaster crm on c.containerMasterId = crm.containerMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and crm.yardMasterId = port_yard_Id;

ELSEIF (type_Id = 4)  Then -- Port To CFS
Select distinct c.* from transporter.containermaster c
Inner Join transporter.portcfsratemaster crm on c.containerMasterId = crm.containerMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and crm.portMasterId = port_yard_Id;

End IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllCFSPortsbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSPortsbyUserId`(in user_Id int)
BEGIN

Select distinct p.* from transporter.portmaster p
Inner Join transporter.cfsuserregistration cur on cur.userId = user_Id 
Left Outer Join transporter.cfsportratemaster crm on p.portMasterId = crm.portMasterId and crm.cfsMasterId = cur.cfsMasterId
Left Outer Join transporter.portcfsratemaster prm on p.portMasterId = prm.portMasterId and prm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllCFSWeightsbyUserandContainerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSWeightsbyUserandContainerId`(in user_Id int, in type_Id int, in container_Id int, in port_yard_Id int)
BEGIN

IF (type_Id = 1) Then -- CFS To Yard

Select distinct w.* from transporter.weightmaster w
Inner Join transporter.cfsyardratemaster yrm on w.weightMasterId = yrm.weightMasterId
Inner Join transporter.cfsuserregistration cur on yrm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and yrm.containerMasterId = container_Id
and yrm.yardMasterId = port_yard_Id;

ELSEIF (type_Id = 2)  Then -- -- CFS To Port

Select distinct w.* from transporter.weightmaster w
Inner Join transporter.cfsportratemaster crm on w.weightMasterId = crm.weightMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and crm.containerMasterId= container_Id
and crm.portMasterId = port_yard_Id;

ELSEIF (type_Id = 3)  Then -- -- Yard To CFS

Select distinct w.* from transporter.weightmaster w
Inner Join transporter.yardcfsratemaster crm on w.weightMasterId = crm.weightMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and crm.containerMasterId= container_Id
and crm.yardMasterId = port_yard_Id;

ELSEIF (type_Id = 4)  Then -- -- Port To CFS

Select distinct w.* from transporter.weightmaster w
Inner Join transporter.portcfsratemaster crm on w.weightMasterId = crm.weightMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and crm.containerMasterId= container_Id
and crm.portMasterId = port_yard_Id;

End IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllCFSYardsbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSYardsbyUserId`(in user_Id int)
BEGIN

Select distinct y.* from transporter.yardmaster y
Inner Join transporter.cfsuserregistration cur on cur.userId = user_Id 
Left Outer Join transporter.yardcfsratemaster yrm on y.yardMasterId = yrm.yardMasterId and yrm.cfsMasterId = cur.cfsMasterId
Left Outer Join transporter.cfsyardratemaster crm on y.yardMasterId = crm.yardMasterId and crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllDriversbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllDriversbyUserId`(in user_Id int)
BEGIN
Select d.* from transporter.driver d
Inner join transporter.drivertransportermapping dtm on d.userId = dtm.driverId
Where dtm.userId = user_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllOrdersbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllOrdersbyUserId`(in user_Id int)
BEGIN

declare role_Id int;
Select typeSyscode into role_Id from transporter.user where userId = user_Id;

if(role_Id = 1) then

select ord.orderId, ord.sourceType,ord.destinationType,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    ptm.terminal,
ord.orderRemarks,ord.totalRate,
ord.orderStatus,DATE_FORMAT(ord.orderDate,'%d-%b-%Y') as OrderDate,
DATE_FORMAT(ord.createdOn,'%d-%b-%Y') as CreatedOn
from transporter.order ord
inner join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
where ord.isDeleted = 0;  
Else

select ord.orderId, ord.sourceType,ord.destinationType,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    ptm.terminal,
ord.orderRemarks,ord.totalRate,
ord.orderStatus,DATE_FORMAT(ord.orderDate,'%d-%b-%Y') as OrderDate,
DATE_FORMAT(ord.createdOn,'%d-%b-%Y') as CreatedOn
from transporter.order ord
inner join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
where ord.createdBy = user_Id and ord.isDeleted = 0;
End if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllPermissionsbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPermissionsbyUserId`(in user_Id int)
BEGIN
declare role_Id int;

Select typeSyscode into role_Id from transporter.user
where userId = user_Id;

Select GROUP_CONCAT(p.permissionName) as Permissions from permission p 
inner join permissionrolemapping prm on p.permissionId = prm.permissionId
Where prm.roleId = role_Id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllSubOrdersbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllSubOrdersbyUserId`(in user_Id int)
BEGIN

declare role_Id int;
Select typeSyscode into role_Id from transporter.user where userId = user_Id;

if(role_Id = 1 or role_Id = 5) then
Select ord.orderId, subo.subOrderId, subo.subOrderTotalMargin,subo.CutOffTime,subo.suborderStatus,
c.containerMasterName,w.weightDesc, DATE_FORMAT(subo.createdOn,'%d-%b-%Y') as SubOrderDate
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
where subo.isDelete = 0;
else
Select ord.orderId, subo.subOrderId, subo.subOrderTotalMargin,subo.CutOffTime,subo.suborderStatus,
c.containerMasterName,w.weightDesc, DATE_FORMAT(subo.createdOn,'%d-%b-%Y') as SubOrderDate
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
where subo.createdBy = user_Id and subo.isDelete = 0; 
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllTransporter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllTransporter`()
BEGIN
SELECT userId, email , firstName , lastname , mobileNumber
 FROM transporter.user
where typeSyscode = 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllTripsbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllTripsbyUserId`(in user_Id int)
BEGIN

declare roleId int;

Select typeSyscode into roleId from transporter.user
where userId = user_Id;


If (roleId = 5) then -- Transporter 

Select t.subOrderId,t.sourceId,t.destinationId,t.assignedVehicle,
t.assignedDriver,t.tripstatus,t.startDate,t.endDate,t.billedAmount,
t.createdBy,t.createdOn, concat(u.firstName ,' ',u.lastName) as DriverName,
v.vehicleNumber,t.tripId,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName
from transporter.trip t
Inner Join transporter.suborder so on t.subOrderId = so.subOrderId
Inner Join transporter.order ord on so.orderId = ord.orderId
Left Outer Join transporter.vehiclemaster v on v.vehicleMasterId = t.assignedVehicle
Left Outer Join transporter.driver u on u.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = v.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = v.vehicletype
left outer join transporter.containermaster c on so.containerType = c.containerMasterId
left outer join transporter.weightmaster w on so.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
Where t.createdBy = user_Id ;

Elseif(roleId = 6) then -- Driver
Select t.subOrderId,t.sourceId,t.destinationId,t.assignedVehicle,
t.assignedDriver,t.tripstatus,t.startDate,t.endDate,t.billedAmount,
t.createdBy,t.createdOn, concat(u.firstName ,' ',u.lastName) as DriverName,
v.vehicleNumber,t.tripId,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName
from transporter.trip t
Inner Join transporter.suborder so on t.subOrderId = so.subOrderId
Inner Join transporter.order ord on so.orderId = ord.orderId
Left Outer Join transporter.vehiclemaster v on v.vehicleMasterId = t.assignedVehicle
Left Outer Join transporter.driver u on u.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = v.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = v.vehicletype
left outer join transporter.containermaster c on so.containerType = c.containerMasterId
left outer join transporter.weightmaster w on so.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
Where u.userId = user_Id ;

else

Select t.subOrderId,t.sourceId,t.destinationId,t.assignedVehicle,
t.assignedDriver,t.tripstatus,t.startDate,t.endDate,t.billedAmount,
t.createdBy,t.createdOn, concat(dusr.firstName ,' ',dusr.lastName) as DriverName,
vhl.vehicleNumber,t.tripId,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy;

End If;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllVehiclesbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllVehiclesbyUserId`(in user_Id int)
BEGIN

Select v.* from transporter.vehiclemaster v
Inner join transporter.vehicletransportermapping vtm on v.vehicleMasterId = vtm.vehicleMasterId
Where vtm.userId = user_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBidDetailsByBidId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBidDetailsByBidId`(in bidId Int)
BEGIN
if(bidId=0) then
SELECT bi.bidName,bi.exhibitionDate,bi.subOrderId,bi.createdBy,bi.originalRate ,
map.bidName ,map.bidName ,map.bidValue , map.bidStatus,map.createdOn ,map.userId
      , us.firstName,us.email
FROM transporter.bid bi
 left outer join bidusermapping map on map.bidId = bi.bidId
  left outer join user us on map.userId = us.userId;
else
SELECT bi.bidName,bi.exhibitionDate,bi.subOrderId,bi.createdBy,bi.originalRate ,
map.bidName ,map.bidName ,map.bidValue , map.bidStatus,map.createdOn ,map.userId
      , us.firstName,us.email
FROM transporter.bid bi
 left outer join bidusermapping map on map.bidId = bi.bidId
  left outer join user us on map.userId = us.userId
  where bi.bidId = bidId;
 END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBidsbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBidsbyUserId`(In user_Id int)
BEGIN

declare roleId int;

Select typeSyscode into roleId from transporter.user
where userId = user_Id;


if roleId = 5 then -- Transporter
	
    Select b.bidId,b.bidName,b.bidLowerLimit,
    case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  SorurceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    com.containerMasterName, wem.weightDesc,
    com.containerMasterId, wem.weightMasterId,
    -- (select  IFNULL(bidValue,0) from transporter.bidusermapping where bidId = b.bidId and userId = user_Id 
    -- ) as bidValue
    case when bum.userId = user_Id then bidValue else null end as bidValue,
    case when bum.userId = user_Id then biduserStatus else null end as biduserStatus,
    b.originalRate,bum.bidusermappingId
    from transporter.order ord
    Left Outer Join transporter.suborder sub on ord.orderId = sub.orderId
    Left Outer Join  transporter.bid b  on sub.subOrderId = b.subOrderId
    Left Outer Join transporter.bidusermapping bum on b.bidId = bum.bidId and bum.userId = user_Id 
    -- Inner Join transporter.bidusermapping bm on bm.userId = user_Id 
    Left Outer Join transporter.containermaster com on sub.containerType= com.containerMasterId
    Left Outer Join transporter.weightmaster wem on containerWeightType=wem.weightMasterId
    Where b.isActive = 1;  
    
else -- Admin User
    Select b.bidId,b.bidName,b.bidLowerLimit,
    case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  SorurceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    com.containerMasterName, wem.weightDesc,
    com.containerMasterId, wem.weightMasterId,
    bm.bidValue,bm.biduserStatus, b.originalRate
    from transporter.bid b
    Left Outer Join transporter.suborder sub on b.subOrderId = sub.subOrderId
    Left Outer Join transporter.order ord on sub.orderId = ord.orderId
    Left Outer Join transporter.bidusermapping bm on b.bidId = bm.bidId
    Left Outer Join transporter.containermaster com on sub.containerType= com.containerMasterId
    Left Outer Join transporter.weightmaster wem on containerWeightType=wem.weightMasterId
    ;
    
End if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDashboardForAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForAdmin`(in user_Id int)
BEGIN



-- Get All Orders
CREATE TEMPORARY TABLE Orders
select ord.orderId, ord.sourceType,ord.destinationType,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    ptm.terminal,
ord.orderRemarks,ord.totalRate,
ord.orderStatus,DATE_FORMAT(ord.orderDate,'%d-%b-%Y') as OrderDate,
DATE_FORMAT(ord.createdOn,'%d-%b-%Y') as CreatedOn
from transporter.order ord
inner join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId;


-- Get All SubOrders
CREATE TEMPORARY TABLE SubOrders
Select ord.orderId, subo.subOrderId, subo.subOrderTotalMargin,subo.CutOffTime,subo.suborderStatus,
c.containerMasterName,w.weightDesc, DATE_FORMAT(subo.createdOn,'%d-%b-%Y') as SubOrderDate
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId;


-- Get All Bids
CREATE TEMPORARY TABLE Bids
Select b.bidName,  b.subOrderId, 
b.bidStatus, b.originalRate, bm.bidValue,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
bm.biduserStatus as AwardStatus, ord.sourceType, ord.destinationType,
c.containerMasterName,w.weightDesc
from transporter.bid b
Left Outer Join transporter.bidusermapping bm on b.bidId = bm.bidId
Inner Join transporter.suborder subo on b.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = bm.userId;

-- Get All Trips

CREATE TEMPORARY TABLE Trips
Select t.tripId, subo.subOrderId, concat(usr.firstName ,' ',usr.lastName) TransporterName,
 vhl.vehicleNumber AssignedVehicle,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy;

Select count(*) as TotalOrders from Orders;
Select count(*) as TotalSubOrders from SubOrders;
Select count(*) as TotalBids from Bids;
Select count(*) as TotalTrips from Trips;

Select * from Orders;
Select * from SubOrders;
Select * from Bids;
Select * from Trips;

DROP TEMPORARY TABLE Orders;
DROP TEMPORARY TABLE SubOrders;
DROP TEMPORARY TABLE Bids;
DROP TEMPORARY TABLE Trips;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDashboardForCFS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForCFS`(IN user_Id int)
BEGIN

CREATE TEMPORARY TABLE Orders
select ord.orderId, ord.sourceType,ord.destinationType,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    ptm.terminal,
ord.orderRemarks,ord.totalRate,
ord.orderStatus,DATE_FORMAT(ord.orderDate,'%d-%b-%Y') as OrderDate
from transporter.order ord
inner join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
Where ord.createdBy =  user_Id;

CREATE TEMPORARY TABLE Trips
Select t.tripId, subo.subOrderId, concat(usr.firstName ,' ',usr.lastName) TransporterName,
 vhl.vehicleNumber AssignedVehicle,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
where ord.createdBy =  user_Id;

Select count(*) as TotalOrders from Orders;
Select count(*) as TotalTrips from Trips;

Select * from Orders;
Select * from Trips;

DROP TEMPORARY TABLE Orders;
DROP TEMPORARY TABLE Trips;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDashboardForDriver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForDriver`(In user_Id int)
BEGIN

CREATE TEMPORARY TABLE Trips
Select t.tripId, subo.subOrderId, concat(usr.firstName ,' ',usr.lastName) TransporterName,
 vhl.vehicleNumber AssignedVehicle,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
Where dusr.userId = user_Id;

Select count(*) as TotalTrips from Trips;
Select * from Trips;

DROP TEMPORARY TABLE Trips;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDashboardForTransporter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForTransporter`(In user_Id int)
BEGIN

-- Get All SubOrders
CREATE TEMPORARY TABLE SubOrders
Select ord.orderId, subo.subOrderId, subo.subOrderTotalMargin,subo.CutOffTime,subo.suborderStatus,
c.containerMasterName,w.weightDesc, DATE_FORMAT(subo.createdOn,'%d-%b-%Y') as SubOrderDate
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId;

-- Get All Bids
CREATE TEMPORARY TABLE Bids
Select b.bidName,  b.subOrderId, 
b.bidStatus, b.originalRate, bm.bidValue,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
bm.biduserStatus as AwardStatus, ord.sourceType, ord.destinationType,
c.containerMasterName,w.weightDesc
from transporter.bid b
Inner Join transporter.bidusermapping bm on b.bidId = bm.bidId and bm.userId = user_Id
Inner Join transporter.suborder subo on b.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = bm.userId;

CREATE TEMPORARY TABLE Trips
Select t.tripId, subo.subOrderId, concat(usr.firstName ,' ',usr.lastName) TransporterName,
 vhl.vehicleNumber AssignedVehicle,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
Where t.createdBy = user_Id;


Select count(*) as TotalSubOrders from SubOrders;
Select count(*) as TotalBids from Bids;
Select count(*) as TotalTrips from Trips;


Select * from SubOrders;
Select * from Bids;
Select * from Trips;


DROP TEMPORARY TABLE SubOrders;
DROP TEMPORARY TABLE Bids;
DROP TEMPORARY TABLE Trips;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTripDetailsbyTripId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTripDetailsbyTripId`(in trip_Id int)
BEGIN

Select t.tripId, subo.subOrderId, 
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
 vhl.vehicleNumber AssignedVehicle,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus,t.billedAmount,
 t.sourceId,t.destinationId,
 DATE_FORMAT(ord.orderDate,'%d-%b-%Y') as OrderDate,
 case when t.startedBy is not null then concat(stusr.firstName ,' ',stusr.lastName) else 'NA' end as StartedBy,
 case when t.startDate is not null then concat(DATE_FORMAT(t.startDate,'%d-%b-%Y'),' On ',DATE_FORMAT(t.startDate,'%H:%i:%s')) else 'NA' end StartedAt,
 case when t.stoppeddBy is not null then concat(edusr.firstName ,' ',edusr.lastName) else 'NA' end as StoppedBy,
 case when t.endDate is not null then concat(DATE_FORMAT(t.endDate,'%d-%b-%Y'),' On ',DATE_FORMAT(t.endDate,'%H:%i:%s')) else 'NA' end StoppedAt
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
left outer join transporter.user stusr on stusr.userId = t.startedBy
left outer join transporter.user edusr on edusr.userId = t.stoppeddBy
Where t.tripId = trip_Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTripsbyId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTripsbyId`(in trip_Id int)
BEGIN
Select t.subOrderId,t.sourceId,t.destinationId,t.assignedVehicle,
t.assignedDriver,t.tripstatus,t.startDate,t.endDate,t.billedAmount,
t.createdBy,t.createdOn, u.firstName + " - " + u.lastName as DriverName,
v.vehicleNumber,t.tripId,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName
from transporter.trip t
Inner Join transporter.suborder so on t.subOrderId = so.subOrderId
Inner Join transporter.order ord on so.orderId = ord.orderId
Left Outer Join transporter.vehiclemaster v on v.vehicleMasterId = t.assignedVehicle
Left Outer Join transporter.user u on u.userId = t.assignedDriver
Where t.tripId = trip_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MULTIPLETABLES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MULTIPLETABLES`(IN userid varchar(10),IN roleid varchar(10))
BEGIN
SELECT c.* FROM transporter2.cfsmaster c
Left Outer Join locationmaster l on c.locationId = l.locationId;

/*Inner Join transporter2.user u 
on c.userId = u.id and c.roleId = u.typeSyscode
Where c.userId = userid and c.roleId = roleid;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `postOrderProcessing_OLD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `postOrderProcessing_OLD`(in order_Id int)
Begin
Declare cfsRate decimal(10,2);
Declare containerType int default 0;
Declare weightType int default 0;
Declare trucks int default 0;
Declare orderRate decimal(10,2) default 0.00;
Declare masterType int default 0; 
Declare sourceID int default 0;
Declare destinationID int default 0;
Declare profit_margin decimal(10,2);
Declare profit_Rate decimal(10,2);
Declare order_date datetime;
Declare fromVal varchar(15);
Declare timeSlotId int default 0;

Select masterTypeId,sourceId,destinationId,DATE(orderDate),timeslotMasterId 
into masterType,sourceID,destinationID,order_date,timeSlotId
FROM transporter2.order where orderid = order_Id;

Select fromValue into  fromVal from transporter.timeslotmaster Where timeslotMasterId = timeSlotId;
Set fromVal = Concat(cast(order_date as char(12)) ,  fromVal ,":00:00"); 

Update transporter.order set orderDate = fromVal where orderid = order_Id;

Select settings_value into profit_margin
from settings Where settings_name = 'cfs_order_profit';



Begin
   DECLARE exit_loop int default 0; 
   DECLARE order_cursor CURSOR FOR
     Select container_type, weight_type,no_of_trucks
     from transporter2.container where orderId = order_Id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = 1;
   OPEN order_cursor;
   
   REPEAT
  
     FETCH  order_cursor INTO containerType,weightType,trucks;
     
     IF NOT exit_loop  THEN
		If masterType = 4 then
			Set cfsRate := (select rate * trucks
			from transporter2.cfsratemaster
			Where portId = sourceID and cfsId = destinationID
			and weightId = weightType and containerId = containerType);
			Set orderRate = orderRate + cfsRate;
		ElseIf masterType = 2 then
			Set cfsRate := (select rate * trucks
			from transporter2.cfsratemaster
			Where portId = destinationID and cfsId = sourceID
			and weightId = weightType and containerId = containerType);
			Set orderRate = orderRate + cfsRate;
        ElseIf masterType = 3 then
			Set cfsRate := (select rate * trucks
			from transporter2.yardcfsratemaster
			Where yardId = sourceID and cfsId = destinationID
			and weightId = weightType and containerId = containerType);
			Set orderRate = orderRate + cfsRate;
        ElseIf masterType = 1 then
			Set cfsRate := (select rate * trucks
			from transporter2.yardcfsratemaster
			Where yardId = destinationID and cfsId = sourceID
			and weightId = weightType and containerId = containerType);
			Set orderRate = orderRate + cfsRate;
		End if;
        
     END IF;
     UNTIL exit_loop END REPEAT;
    
   close order_cursor;
   
	Set profit_Rate = (orderRate * profit_margin)/ 100;
	Update transporter2.order set totalRate = orderRate,
    profitMarginPercentage = profit_margin,
    profitRate = profit_Rate,
    rateexcludingProfit = orderRate - profit_Rate
    Where orderId = order_Id;
    
    
    Insert into transporter2.bid(bidName,containerId,container_type,
    container_weight_type,source_type,destination_type,original_rate,
    bid_rate,margin_percent,order_masterTypeId,
    source_name,destination_name,orderId,is_active,created_by,created_on) 
	Select GetBidNumber(),t.containerId,c.container_type,c.weight_type,
    ord.source_type,ord.destination_type,cr.rate,
    (cr.rate - ((cr.rate * s.settings_value) / 100)),
    s.settings_value,ord.masterTypeId,
    case 
    When ord.masterTypeId = 4 then 
    p.port_name
    When ord.masterTypeId = 2 then 
    cm.cfs_name
    When ord.masterTypeId = 3 then 
    y.yard_name
    When ord.masterTypeId = 1 then 
    ycm.cfs_name
    end,
    case 
    When ord.masterTypeId = 4 then 
    cm.cfs_name
    When ord.masterTypeId = 2 then 
    p.port_name
    When ord.masterTypeId = 3 then 
    ycm.cfs_name
    When ord.masterTypeId = 1 then 
    y.yard_name
    end,
	ord.orderId,1,1,CURDATE()
 	From transporter2.order ord
	Inner join transporter2.container c
	on ord.orderId = c.orderId
	Inner Join transporter2.truck t
	on c.containerId = t.containerId
    Left Outer Join transporter2.cfsratemaster cr on
    c.container_type = cr.containerId and c.weight_type = cr.weightId
    Left Outer Join transporter2.yardcfsratemaster ym on
    c.container_type = ym.containerId and c.weight_type = ym.weightId
        Left Outer Join transporter2.portmaster p on cr.portId = p.portId
    Left Outer Join transporter2.cfsmaster cm on cr.cfsId = cm.cfsMasterId 
    Left Outer Join transporter2.yardmaster y on ym.yardId = y.yardId
    Left Outer Join transporter2.cfsmaster ycm on ym.cfsId = ycm.cfsMasterId 
    Left Outer join settings s on settings_name = 'cfs_order_profit' 
	where ord.orderId = order_Id and
    case 
    when ord.masterTypeId = 4 then
     cr.portId = ord.sourceId and cr.cfsId = ord.destinationId
	when ord.masterTypeId = 2 then
	 cr.portId = ord.destinationId and cr.cfsId = ord.sourceId
	when ord.masterTypeId = 3 then
	 ym.yardId = ord.sourceId and ym.cfsId = ord.destinationId
	when ord.masterTypeId = 1 then
	 ym.yardId = ord.destinationId and ym.cfsId = ord.sourceId
     end;
    
  End;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procGetCFSFillOrder_OLD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetCFSFillOrder_OLD`(in user_Id int, in master_Type int)
BEGIN
Declare sourcetype varchar(20);
Declare destinationtype varchar(20);

Select sourceType,destinationType 
into sourcetype,destinationtype
From transporter2.mastertype where masterTypeId = master_Type;

IF(master_Type = 4) THEN
Select rat.containerMasterId,cont.containerMasterName,rat.weightMasterId,
wt.weightDesc
from transporter.cfsuserregistration reg
Inner Join transporter.cfsmaster mas on reg.cfsMasterId = mas.cfsMasterId
Inner Join transporter.cfsratemaster rat on mas.portMasterId = rat.portMasterId
Inner join transporter.containermaster cont 
on rat.containerMasterId = cont.containerMasterId 
Inner Join transporter.weightmaster wt 
on rat.weightMasterId = wt.weightMasterId 
Where reg.userId= user_Id and rat.isActive = 1;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procGetOrderDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetOrderDetails`(orderid int)
BEGIN
select ord.orderId, ord.sourceType,ord.destinationType,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    ptm.terminal,
ord.orderRemarks,ord.orderDate,ord.totalRate,
ord.orderStatus,
subo.subOrderTotalMargin,subo.CutOffTime,subo.suborderStatus,
bid.bidName,
concat(usr.firstName ,' ',usr.lastName) TranporterName,bum.bidValue,bum.biduserStatus,
vhl.vehicleNumber,
case when trp.assignedDriver is not null then 
concat(dusr.firstName ,' ',dusr.lastName) else '' end AssignedDriver,dusr.emailid,dusr.mobileNumber,trp.tripstatus,
wm.weightDesc,cm.containerMasterName
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
inner join  transporter.bid bid on bid.subOrderId= subo.subOrderId
left outer join transporter.bidusermapping bum on bum.bidId = bid.bidId
left outer join transporter.user usr on usr.userId = bum.userId
left outer join transporter.trip trp on trp.subOrderId = subo.subOrderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = trp.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = trp.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
-- where  ord.orderId = orderid; 
where  (ord.orderId = orderid or orderid is null) and (bum.biduserstatusId != 22 or bum.biduserstatusId is null);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procSchedulerConfirmBid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procSchedulerConfirmBid`()
BEGIN
SET SQL_SAFE_UPDATES = 0;


-- First update the suborder with the Bid schedule master id and cutofftime as per there timing
update transporter.suborder  sub
inner join transporter.order ord  on sub.orderid = ord.orderid
inner join transporter.bidschedulemaster bis on TIMESTAMPDIFF(HOUR, ord.createdOn, ord.orderdate) between bis.fromHour and bis.ToHour
set sub.BidScheduleId = bis.BidScheduleId,
	sub.CutOffTime = case when bis.WorkingHours = 0 then DATE_ADD(ord.createdOn, INTERVAL bis.bidingHours HOUR) 
	 when bis.WorkingHours > 0 then FuncGetBidCutofftime(ord.createdon,bis.IsFullhour,bis.totalbidhour)
	end 
where sub.BidScheduleId is null;
-- updte the order on 20 bid first come first serve basis
update bidusermapping bum
inner join 
(
	select bidusermappingId -- um.bidId,um.userid,min(bidValue) bidValue, min(createdOn) createdOn
	from
	(
	SELECT  bd.bidId , Count(bd.bidId) BidCount,subo.CutOffTime
	FROM transporter.bid bd
	inner join transporter.bidusermapping bum on bum.bidId = bd.bidId
	inner join transporter.suborder subo on subo.subOrderId = bd.subOrderId
	group by bd.bidId, subo.CutOffTime
	)bid
	inner join (
select * from 
(
SELECT bidusermappingId ,bidId,userId,bidValue,biduserStatus,DENSE_RANK() OVER (PARTITION BY
                     bidid
                 ORDER BY
                     bidValue,createdOn
                ) bid_rank

FROM transporter.bidusermapping
)t1
where bid_rank = 1) um on um.bidid= bid.bidId
	where bidcount >= 20  or( bidcount > 0 and CutOffTime <= now())
) dtl on dtl.bidusermappingId = bum.bidusermappingId and biduserStatus = 'BID_USER_EDIT'

  set biduserStatus = 'BID_USER_CONFIRMED', biduserStatusId = 5;
  
  -- inserting the confirmed order details to trip
  insert into transporter.trip
(subOrderId,sourceId,destinationId,tripstatus,tripStatusId,createdBy,createdOn,bidValue)
SELECT subo.subOrderId, ord.sourceId, ord.destinationId, 'TRIP_TRANSPORTER_ASSIGNED',16, userId, now(), bum.bidValue
FROM transporter.bidusermapping bum
inner join transporter.bid bd on bd.bidId = bum.bidId
inner join transporter.suborder subo on subo.subOrderId= bd.subOrderId
inner join transporter.order ord on ord.orderId = subo.orderId
left outer join transporter.trip trip on trip.subOrderId = subo.subOrderId 
where biduserStatus = 'BID_USER_CONFIRMED' and tripId is null;

update transporter.suborder sub 
inner join transporter.trip trp  on sub.subOrderId = trp.subOrderId 
set sub.suborderStatus = 'SUB_ORDER_BID_ASSIGNED',
	suborderStatusId = 12
where suborderStatusId != 12;


update transporter.bid bd 
inner join transporter.trip trp  on bd.subOrderId = trp.subOrderId 
set bd.bidStatus = 'BID_ASSIGNED',
	bd.bidStatusId = 2, 
    bd.isActive = 0
where bidStatusId != 2;

update  transporter.bidusermapping bum  
inner join transporter.bid bd on bum.bidid = bd.bidid
inner join transporter.trip trp  on bd.subOrderId = trp.subOrderId 
set bum.biduserStatus = 'BID_USER_DISCARD',
	bum.biduserStatusId = 22
where biduserStatusId != 5 and biduserStatusId != 22;



 update transporter.suborder set cutofftime = now();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repTreeViewOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repTreeViewOrder`()
BEGIN
select ord.orderId ,ord.sourceType,ord.destinationType,ord.orderRemarks,ord.orderDate,ord.totalRate,
ord.orderStatus,
subo.suborderId,subo.subOrderTotal,subo.CutOffTime,cm.containerMasterName,
wm.weightDesc,subo.suborderStatus,
bid.bidName,bid.bidStatus,
concat(usr.firstName ,' ',usr.lastName) UserName,bum.bidValue,bum.biduserStatus,
trp.assignedVehicle,trp.assignedDriver,trp.tripstatus
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
inner join  transporter.bid bid on bid.subOrderId= subo.subOrderId
left outer join transporter.bidusermapping bum on bum.bidId = bid.bidId
left outer join transporter.user usr on usr.userId = bum.userId
left outer join transporter.trip trp on trp.subOrderId = subo.subOrderId
left outer join transporter.containermaster cm on cm.containerMasterId = subo.containerType
left outer join transporter.weightmaster wm on wm.weightMasterId = subo.containerWeightType
where   bum.biduserstatusId != 22;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SEARCHCFSLOCATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCHCFSLOCATION`(IN userId varchar(10))
BEGIN
	SELECT l.*,m.cfsMasterId,m.cfs_name FROM transporter2.locationmaster l
    Inner join transporter2.cfsmaster m
    on l.locationId = m.locationId; 
    -- WHERE m.userId = userId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `subOrderProcessing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `subOrderProcessing`(in order_Id int)
Begin
Declare cfsRate decimal(10,2);
Declare containerType int default 0;
Declare weight_type int default 0;
Declare trucks int default 0;
Declare orderRate decimal(10,2) default 0.00;
Declare masterType, cnt int default 0; 
Declare source_Id int default 0;
Declare destination_Id int default 0;
Declare profit_margin, bid_limit_percent decimal(10,2) default 0.00;
Declare profit_Rate, cfs_rate decimal(10,2) default 0.00;
Declare container_Id int default 0;
Declare created_by int default 0;
Declare subOrderId int default 0;
Declare order_date datetime;
Declare fromVal varchar(30);
Declare timeSlotId int default 0;
-- For Debug 
-- select concat('** ', msg) AS '** DEBUG:';
--
Select masterTypeId,sourceId,destinationId,createdBy,DATE(orderDate),timeslotMasterId  
into masterType,source_Id,destination_Id,created_by,order_date,timeSlotId
FROM transporter.order where orderId = order_Id;

Select fromValue into  fromVal from transporter.timeslotmaster Where timeslotMasterId = timeSlotId;
Set fromVal = concat(fromVal,":00:00"); 

Update transporter.order set orderDate = CONCAT(DATE(order_date),' ',fromVal) where orderid = order_Id;

/*Select settingsValue into profit_margin
from settings Where settingsName = 'cfs_order_profit';

Select settingsValue into bid_limit_percent
from settings Where settingsName = 'bid_lower_limit';*/


Begin
   DECLARE exit_loop int default 0; 
   DECLARE order_cursor CURSOR FOR
     Select containerMasterId, weightType,numberOfTrucks,container_Id
     from transporter.container where orderId = order_Id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = 1;
   OPEN order_cursor;
   
   REPEAT
  
     FETCH  order_cursor INTO containerType,weight_type,trucks,container_Id;
     
     IF NOT exit_loop  THEN
		If masterType = 4 then -- Port To CFS
		select rate * trucks, orderMarginRate into
             cfsRate,profit_margin
			from transporter.portcfsratemaster
			Where portMasterId = source_Id  
            and cfsMasterId = destination_Id
			and weightMasterId = weight_type 
            and containerMasterId = containerType;
			
            -- Set subOrderId = 0;
            -- Set cfs_rate = (cfsRate - ((cfsRate * profit_margin) / 100));
             
           
            
            Set orderRate = orderRate + cfsRate;
            Set profit_Rate = profit_Rate + ((cfsRate * profit_margin)/ 100);
            -- select concat('** ', cfsRate) AS '** DEBUG:';
		ElseIf masterType = 2 then -- CFS To Port
			select rate * trucks, orderMarginRate into
             cfsRate,profit_margin
			from transporter.cfsportratemaster
			Where portMasterId = destination_Id and cfsMasterId = source_Id
			and weightMasterId = weight_type and containerMasterId = containerType;
			Set orderRate = orderRate + cfsRate;
            Set profit_Rate = profit_Rate + ((cfsRate * profit_margin)/ 100);
        ElseIf masterType = 3 then -- Yard To CFS
			select rate * trucks, orderMarginRate into
             cfsRate,profit_margin
			from transporter.yardcfsratemaster yrm
            inner join transporter.cfsmaster cm on yrm.portMasterId = cm.portMasterId
            and yrm.cfsMasterId = cm.cfsMasterId 
			Where yrm.yardMasterId = source_Id and yrm.cfsMasterId = destination_Id
			and weightMasterId = weight_type and containerMasterId = containerType
            and yrm.portMasterId = cm.portMasterId;
			Set orderRate = orderRate + cfsRate;
            Set profit_Rate = profit_Rate + ((cfsRate * profit_margin)/ 100);
        ElseIf masterType = 1 then -- CFS To Yard
			select rate * trucks, orderMarginRate into
             cfsRate,profit_margin
			from transporter.cfsyardratemaster yrm
            inner join transporter.cfsmaster cm on yrm.portMasterId = cm.portMasterId
            and yrm.cfsMasterId = cm.cfsMasterId 
			Where yardMasterId = destination_Id and yrm.cfsMasterId = source_Id
			and weightMasterId = weight_type and containerMasterId = containerType
            and yrm.portMasterId = cm.portMasterId;
			Set orderRate = orderRate + cfsRate;
            Set profit_Rate = profit_Rate + ((cfsRate * profit_margin)/ 100);
		End if;
        Set cnt = cnt + 1;
     END IF;
     UNTIL exit_loop END REPEAT;
    
   close order_cursor;
   
	-- Set profit_Rate = (orderRate * profit_margin)/ 100;
	Update transporter.order set totalRate = orderRate,
    profitMarginPercentage = 0,
    profitRate = profit_Rate,
    orderStatus = 'ORDER_ACCEPTED',
    orderStatusId = 6,
    rateexcludingProfit = orderRate - profit_Rate
    Where orderId = order_Id;
    
    
    -- Insert SubOrder
Insert into transporter.suborder(orderId,subOrderTotal,bidLimit,isDelete,createdBy,
createdOn,modifiedBy,modifiedOn,cotainerId,containerType,containerWeightType,
subOrderTotalMargin,marginPercent,suborderStatus,suborderStatusId)
Select order_Id,
case 
when ord.masterTypeId = 2 then  -- CFS To Port
	(Select (rate - ((rate * orderMarginRate) / 100)) from transporter.cfsportratemaster 
	where cfsMasterId = ord.sourceId and portMasterId = ord.destinationId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 4 then  -- Port To CFS
	(Select (rate - ((rate * orderMarginRate) / 100)) from transporter.portcfsratemaster 
	where cfsMasterId = ord.destinationId and portMasterId = ord.sourceId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 3 then  -- Yard To CFS
	(Select (rate - ((rate * orderMarginRate) / 100)) 
    from transporter.yardcfsratemaster yc
    inner join transporter.cfsmaster cfs on yc.cfsMasterId = cfs.cfsMasterId and yc.portMasterId = cfs.portMasterId
	where yc.cfsMasterId = ord.destinationId and yc.yardMasterId = ord.sourceId
	and yc.containerMasterId = c.containerMasterId and yc.weightMasterId = c.weightType and yc.portMasterId = cfs.portMasterId)
when ord.masterTypeId = 1 then  -- CFS To Yard
	(Select (rate - ((rate * orderMarginRate) / 100)) 
    from transporter.cfsyardratemaster cy
    inner join transporter.cfsmaster cfs on cy.cfsMasterId = cfs.cfsMasterId and cy.portMasterId = cfs.portMasterId
	where cy.cfsMasterId = ord.sourceId and cy.yardMasterId = ord.destinationId 
	and cy.containerMasterId = c.containerMasterId and cy.weightMasterId = c.weightType and cy.portMasterId = cfs.portMasterId)
end ,
case 
when ord.masterTypeId = 2 then  -- CFS To Port
	(Select  bidMarginRate from transporter.cfsportratemaster 
	where cfsMasterId = ord.sourceId and portMasterId = ord.destinationId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 4 then  -- Port To CFS
	(Select bidMarginRate from transporter.portcfsratemaster 
	where cfsMasterId = ord.destinationId and portMasterId = ord.sourceId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 3 then  -- Yard To CFS
	(Select  bidMarginRate 
    from transporter.yardcfsratemaster yc
    inner join transporter.cfsmaster cfs on yc.cfsMasterId = cfs.cfsMasterId and yc.portMasterId = cfs.portMasterId
	where yc.cfsMasterId = ord.destinationId and yc.yardMasterId = ord.sourceId
	and yc.containerMasterId = c.containerMasterId and yc.weightMasterId = c.weightType and yc.portMasterId = cfs.portMasterId)
when ord.masterTypeId = 1 then  -- CFS To Yard
	(Select bidMarginRate
    from transporter.cfsyardratemaster cy
    inner join transporter.cfsmaster cfs on cy.cfsMasterId = cfs.cfsMasterId and cy.portMasterId = cfs.portMasterId
	where cy.cfsMasterId = ord.sourceId and cy.yardMasterId = ord.destinationId 
	and cy.containerMasterId = c.containerMasterId and cy.weightMasterId = c.weightType and cy.portMasterId = cfs.portMasterId)
end, 
0,created_by,CURDATE(),
0,null,t.containerId,c.containerMasterId,
c.weightType,
case 
when ord.masterTypeId = 2 then  -- CFS To Port
	(Select (rate - ((rate * orderMarginRate) / 100)) from transporter.cfsportratemaster 
	where cfsMasterId = ord.sourceId and portMasterId = ord.destinationId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 4 then  -- Port To CFS
	(Select (rate - ((rate * orderMarginRate) / 100)) from transporter.portcfsratemaster 
	where cfsMasterId = ord.destinationId and portMasterId = ord.sourceId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 3 then  -- Yard To CFS
	(Select (rate - ((rate * orderMarginRate) / 100)) 
    from transporter.yardcfsratemaster yc
    inner join transporter.cfsmaster cfs on yc.cfsMasterId = cfs.cfsMasterId and yc.portMasterId = cfs.portMasterId
	where yc.cfsMasterId = ord.destinationId and yc.yardMasterId = ord.sourceId
	and yc.containerMasterId = c.containerMasterId and yc.weightMasterId = c.weightType and yc.portMasterId = cfs.portMasterId)
when ord.masterTypeId = 1 then  -- CFS To Yard
	(Select (rate - ((rate * orderMarginRate) / 100)) 
    from transporter.cfsyardratemaster cy
    inner join transporter.cfsmaster cfs on cy.cfsMasterId = cfs.cfsMasterId and cy.portMasterId = cfs.portMasterId
	where cy.cfsMasterId = ord.sourceId  and cy.yardMasterId = ord.destinationId
	and cy.containerMasterId = c.containerMasterId and cy.weightMasterId = c.weightType and cy.portMasterId = cfs.portMasterId)
end,
0,'SUB_ORDER_PENDING',11
From transporter.order ord
Inner join transporter.container c
on ord.orderId = c.orderId
Inner Join transporter.truck t
on c.containerId = t.containerId
-- Left Outer join settings s on settingsName = 'cfs_order_profit' 
where ord.orderId = order_Id;

            
            
            -- End SubOrder
			-- Insert Bid
			
		Insert into transporter.bid(bidName,originalRate,exhibitionDate,
		subOrderId,isActive,createdBy,createdOn,bidUpperLimit,modifiedBy,
		modifiedOn,bidLowerLimit,bidStatus,bidStatusId)
		Select GetBidNumber(),sub.subOrderTotal,
		null,sub.subOrderId,1,created_by,CURDATE(),0,
		0,null,(sub.subOrderTotal - ((sub.subOrderTotal * sub.bidLimit) / 100)),'BID_PENDING',1
        From suborder sub 
        Where orderId = order_Id;
        
                
            -- End Bid   
    
  End;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-10 18:54:20
