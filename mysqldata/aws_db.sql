-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DELIMITER ;;

DROP PROCEDURE IF EXISTS `GetAllCFSbyUserId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSbyUserId`(IN `'user_Id'` int)
BEGIN

Select cm.* from transporter.cfsmaster cm
Inner Join transporter.cfsuserregistration cur on cm.cfsMasterId = cur.cfsMasterId
Where cur.userId =  user_Id;

END;;

DROP PROCEDURE IF EXISTS `getAllCFSContainersbyUserId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCFSContainersbyUserId`(IN `'user_Id'` int, IN `'type_Id'` int, IN `'port_yard_Id'` int)
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
END;;

DROP PROCEDURE IF EXISTS `GetAllCFSPortsbyUserId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSPortsbyUserId`(IN `'user_Id'` int)
BEGIN

Select distinct p.* from transporter.portmaster p
Inner Join transporter.cfsuserregistration cur on cur.userId = user_Id
Left Outer Join transporter.cfsportratemaster crm on p.portMasterId = crm.portMasterId and crm.cfsMasterId = cur.cfsMasterId
Left Outer Join transporter.portcfsratemaster prm on p.portMasterId = prm.portMasterId and prm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id;

END;;

DROP PROCEDURE IF EXISTS `GetAllCFSWeightsbyUserandContainerId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSWeightsbyUserandContainerId`(IN `'user_Id'` int, IN `'type_Id'` int, IN `'container_Id'` int, IN `'port_yard_Id'` int)
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
END;;

DROP PROCEDURE IF EXISTS `GetAllCFSYardsbyUserId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSYardsbyUserId`(IN `'user_Id'` int)
BEGIN

Select distinct y.* from transporter.yardmaster y
Inner Join transporter.cfsuserregistration cur on cur.userId = user_Id
Left Outer Join transporter.yardcfsratemaster yrm on y.yardMasterId = yrm.yardMasterId and yrm.cfsMasterId = cur.cfsMasterId
Left Outer Join transporter.cfsyardratemaster crm on y.yardMasterId = crm.yardMasterId and crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id;

END;;

DROP PROCEDURE IF EXISTS `GetAllDriversbyUserId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllDriversbyUserId`(IN `'user_Id'` int)
BEGIN
Select d.* from transporter.driver d
Inner join transporter.drivertransportermapping dtm on d.userId = dtm.driverId
Where dtm.userId = user_Id;
END;;

DROP PROCEDURE IF EXISTS `GetAllOrdersbyUserId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllOrdersbyUserId`(IN `'user_Id'` int)
BEGIN

Select
 ord.orderId, ord.sourceType,ord.destinationType,ord.orderRemarks,ord.orderDate,ord.totalRate,
 ord.orderStatus,ord.orderStatusId,ptm.terminal,
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
    from transporter.order ord
    inner join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
    Where ord.createdBy = user_Id And ord.isDeleted = 0;
END;;

DROP PROCEDURE IF EXISTS `GetAllPermissionsbyUserId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPermissionsbyUserId`(IN `'user_id'` tinyint)
BEGIN
declare role_Id int;
Select typeSyscode into role_Id from transporter.user
where userId = userId;
Select GROUP_CONCAT(p.permissionName) as Permissions from permission p
inner join permissionrolemapping prm on p.permissionId = prm.permissionId
Where prm.roleId = role_Id;
END;;

DROP PROCEDURE IF EXISTS `GetAllSubOrdersbyUserId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllSubOrdersbyUserId`(IN `'user_Id'` int)
BEGIN
Select subo.subOrderId, subo.subOrderTotalMargin,subo.CutOffTime,subo.subOrderTotal,
subo.subOrderTotalMargin,subo.suborderStatus,suborderStatusId,
wm.weightDesc,cm.containerMasterName
from transporter.suborder subo
left outer join transporter.weightmaster wm on wm.weightMasterId = subo.containerWeightType
left outer join transporter.containermaster cm on cm.containerMasterId = subo.containerType
where subo.createdBy = user_Id and isDelete = 0;

END;;

DROP PROCEDURE IF EXISTS `GetAllTransporter`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllTransporter`()
BEGIN
SELECT userId, email , firstName , lastname , mobileNumber
 FROM transporter.user
where typeSyscode = 5;
END;;

DROP PROCEDURE IF EXISTS `GetAllTripsbyUserId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllTripsbyUserId`(IN `'user_Id'` int)
BEGIN

declare roleId int;

Select typeSyscode into roleId from transporter.user
where userId = user_Id;


If (roleId = 5) then -- Transporter

Select t.subOrderId,t.sourceId,t.destinationId,t.assignedVehicle,
t.assignedDriver,t.tripstatus,t.startDate,t.endDate,t.billedAmount,
t.createdBy,t.createdOn, concat(u.firstName ,' ',u.lastName) as DriverName,
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
Left Outer Join transporter.driver u on u.driverId = t.assignedDriver
Where t.createdBy = user_Id ;

Elseif(roleId = 6) then -- Driver
Select t.subOrderId,t.sourceId,t.destinationId,t.assignedVehicle,
t.assignedDriver,t.tripstatus,t.startDate,t.endDate,t.billedAmount,
t.createdBy,t.createdOn, concat(u.firstName ,' ',u.lastName) as DriverName,
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
Left Outer Join transporter.driver u on u.driverId = t.assignedDriver
Where u.userId = user_Id ;
End If;

END;;

DROP PROCEDURE IF EXISTS `GetAllVehiclesbyUserId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllVehiclesbyUserId`(IN `'user_Id'` int)
BEGIN

Select v.* from transporter.vehiclemaster v
Inner join transporter.vehicletransportermapping vtm on v.vehicleMasterId = vtm.vehicleMasterId
Where vtm.userId = user_Id;
END;;

DROP PROCEDURE IF EXISTS `GetBidDetailsByBidId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBidDetailsByBidId`(IN `'bidId'` int)
BEGIN
if(bidId=0) then
SELECT bi.bidName,bi.exhibitionDate,bi.subOrderId,bi.createdBy,bi.originalRate ,
bi.bidName ,map.bidValue , bi.bidStatus,map.createdOn ,map.userId
      , us.firstName,us.email
FROM transporter.bid bi
 left outer join bidusermapping map on map.bidId = bi.bidId
  left outer join user us on map.userId = us.userId;
else
SELECT bi.bidName,bi.exhibitionDate,bi.subOrderId,bi.createdBy,bi.originalRate ,
bi.bidName ,map.bidValue , bi.bidStatus,map.createdOn ,map.userId
      , us.firstName,us.email
FROM transporter.bid bi
 left outer join bidusermapping map on map.bidId = bi.bidId
  left outer join user us on map.userId = us.userId
  where bi.bidId = bidId;
 END IF;
END;;

DROP PROCEDURE IF EXISTS `GetBidsbyUserId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBidsbyUserId`(IN `'user_Id'` int)
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
    end sourceName,
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
    Where b.isActive = 1
    order by b.bidId DESC;

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
    com.containerMasterName, wem.weightDesc,
    com.containerMasterId, wem.weightMasterId,
    bm.bidValue,bm.biduserStatus, b.originalRate
    from transporter.bid b
    Left Outer Join transporter.suborder sub on b.subOrderId = sub.subOrderId
    Left Outer Join transporter.order ord on sub.orderId = ord.orderId
    Left Outer Join transporter.bidusermapping bm on b.bidId = bm.bidId
    Left Outer Join transporter.containermaster com on sub.containerType= com.containerMasterId
    Left Outer Join transporter.weightmaster wem on containerWeightType=wem.weightMasterId
	order by b.bidId DESC;

End if;

END;;

DROP PROCEDURE IF EXISTS `getDashboardForAdmin`;;
CREATE PROCEDURE `getDashboardForAdmin`(IN `'user_id'` tinyint)
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
END;;

DROP PROCEDURE IF EXISTS `getDashboardForCFS`;;
CREATE PROCEDURE `getDashboardForCFS`(IN `user_Id` int)
BEGIN
CREATE TEMPORARY TABLE Orders
select DISTINCTROW  ord.orderId, ord.sourceType,ord.destinationType,
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
Select DISTINCTROW  t.tripId, subo.subOrderId, concat(usr.firstName ,' ',usr.lastName) TransporterName,
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

Select count(*) as TotalOrders from Orders od;
Select count(*) as TotalTrips from Trips tr;

Select DISTINCTROW  * from Orders od;
Select DISTINCTROW  * from Trips tr;

DROP TEMPORARY TABLE Orders;
DROP TEMPORARY TABLE Trips;


END;;

DROP PROCEDURE IF EXISTS `getDashboardForDriver`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForDriver`(IN `user_Id` int)
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

END;;

DROP PROCEDURE IF EXISTS `getDashboardForTransporter`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForTransporter`(IN `user_Id` int)
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

END;;

DROP PROCEDURE IF EXISTS `GetTripDetailsbyTripId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTripDetailsbyTripId`(IN `'trip_Id'` int)
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

END;;

DROP PROCEDURE IF EXISTS `GetTripsbyId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTripsbyId`(IN `'trip_Id'` int)
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
END;;

DROP PROCEDURE IF EXISTS `procGetOrderDetails`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetOrderDetails`(IN `'orderid'` int)
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
vhl.vehicleNumber,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,dusr.emailid,dusr.mobileNumber,trp.tripstatus,
wm.weightDesc,cm.containerMasterName
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
inner join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
inner join  transporter.bid bid on bid.subOrderId= subo.subOrderId
left outer join transporter.bidusermapping bum on bum.bidId = bid.bidId
left outer join transporter.user usr on usr.userId = bum.userId
left outer join transporter.trip trp on trp.subOrderId = subo.subOrderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = trp.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = trp.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype

where  (ord.orderId = orderid or orderid is null) and (bum.biduserstatusId != 22 or bum.biduserstatusId is null);
END;;

DROP PROCEDURE IF EXISTS `procSchedulerConfirmBid`;;
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

end;;

DROP PROCEDURE IF EXISTS `subOrderProcessing`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `subOrderProcessing`(IN `'order_Id'` int)
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
case
when ord.masterTypeId = 2 then  -- CFS To Port
	(Select  orderMarginRate from transporter.cfsportratemaster
	where cfsMasterId = ord.sourceId and portMasterId = ord.destinationId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 4 then  -- Port To CFS
	(Select orderMarginRate from transporter.portcfsratemaster
	where cfsMasterId = ord.destinationId and portMasterId = ord.sourceId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 3 then  -- Yard To CFS
	(Select  orderMarginRate
    from transporter.yardcfsratemaster yc
    inner join transporter.cfsmaster cfs on yc.cfsMasterId = cfs.cfsMasterId and yc.portMasterId = cfs.portMasterId
	where yc.cfsMasterId = ord.destinationId and yc.yardMasterId = ord.sourceId
	and yc.containerMasterId = c.containerMasterId and yc.weightMasterId = c.weightType and yc.portMasterId = cfs.portMasterId)
when ord.masterTypeId = 1 then  -- CFS To Yard
	(Select orderMarginRate
    from transporter.cfsyardratemaster cy
    inner join transporter.cfsmaster cfs on cy.cfsMasterId = cfs.cfsMasterId and cy.portMasterId = cfs.portMasterId
	where cy.cfsMasterId = ord.sourceId and cy.yardMasterId = ord.destinationId
	and cy.containerMasterId = c.containerMasterId and cy.weightMasterId = c.weightType and cy.portMasterId = cfs.portMasterId)
end,created_by,CURDATE(),
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
END;;

DELIMITER ;

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `bid`;
CREATE TABLE `bid` (
  `bidId` int NOT NULL AUTO_INCREMENT,
  `bidName` varchar(512) DEFAULT NULL,
  `originalRate` int DEFAULT NULL,
  `exhibitionDate` datetime DEFAULT NULL,
  `subOrderId` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `bidUpperLimit` int DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `bidLowerLimit` int DEFAULT NULL,
  `bidRate` int DEFAULT NULL,
  `bidStatus` varchar(512) DEFAULT NULL,
  `bidStatusId` int DEFAULT NULL,
  PRIMARY KEY (`bidId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `bidusermapping`;
CREATE TABLE `bidusermapping` (
  `bidusermappingId` int NOT NULL AUTO_INCREMENT,
  `bidId` int NOT NULL,
  `userId` int NOT NULL,
  `bidValue` int DEFAULT NULL,
  `biduserStatus` varchar(512) DEFAULT NULL,
  `biduserStatusId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`bidusermappingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cfsmaster`;
CREATE TABLE `cfsmaster` (
  `cfsMasterId` int NOT NULL AUTO_INCREMENT,
  `cfsName` varchar(512) DEFAULT NULL,
  `contactNumber` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `cfsCodeNumber` varchar(512) DEFAULT NULL,
  `gstin` varchar(512) DEFAULT NULL,
  `pan` varchar(512) DEFAULT NULL,
  `tan` varchar(512) DEFAULT NULL,
  `primaryContactName` varchar(512) DEFAULT NULL,
  `primaryContactNumber` varchar(512) DEFAULT NULL,
  `additionalContactName` varchar(512) DEFAULT NULL,
  `additionalContactNumber` varchar(512) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `portMasterId` int DEFAULT NULL,
  `locationMasterId` int DEFAULT NULL,
  `stateMasterId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cfsMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cfsportratemaster`;
CREATE TABLE `cfsportratemaster` (
  `cfsPortRateMasterId` int NOT NULL AUTO_INCREMENT,
  `portMasterId` int DEFAULT NULL,
  `weightMasterId` int DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `bidMarginRate` int DEFAULT NULL,
  `orderMarginRate` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `containerMasterId` int DEFAULT NULL,
  `cfsMasterId` int DEFAULT NULL,
  PRIMARY KEY (`cfsPortRateMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cfsuserregistration`;
CREATE TABLE `cfsuserregistration` (
  `cfsUserRegistrationId` int NOT NULL AUTO_INCREMENT,
  `cfsMasterId` int DEFAULT NULL,
  `userTypeId` int DEFAULT NULL,
  `cfsUserName` varchar(512) DEFAULT NULL,
  `cfsUserDesignation` varchar(512) DEFAULT NULL,
  `cfsUserDepartment` varchar(512) DEFAULT NULL,
  `cfsUserMobileNumber` varchar(512) DEFAULT NULL,
  `cfsUserEmail` varchar(512) DEFAULT NULL,
  `cfsUserPassword` varchar(512) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`cfsUserRegistrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cfsyardratemaster`;
CREATE TABLE `cfsyardratemaster` (
  `cfsYardRateMasterId` int NOT NULL AUTO_INCREMENT,
  `cfsMasterId` int NOT NULL,
  `yardMasterId` int NOT NULL,
  `containerMasterId` int NOT NULL,
  `weightMasterId` int NOT NULL,
  `rate` int NOT NULL,
  `bidMarginRate` int DEFAULT NULL,
  `orderMarginRate` int DEFAULT NULL,
  `portMasterId` int NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`cfsYardRateMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `container`;
CREATE TABLE `container` (
  `containerId` int NOT NULL AUTO_INCREMENT,
  `orderId` int DEFAULT NULL,
  `weightType` int DEFAULT NULL,
  `numberOfTrucks` int DEFAULT NULL,
  `containerMasterId` int DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`containerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `containermaster`;
CREATE TABLE `containermaster` (
  `containerMasterId` int NOT NULL AUTO_INCREMENT,
  `containerMasterName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`containerMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `dieselratemaster`;
CREATE TABLE `dieselratemaster` (
  `dieselRateId` int NOT NULL AUTO_INCREMENT,
  `dieselRate` int DEFAULT NULL,
  `dieselRateDate` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`dieselRateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `driver`;
CREATE TABLE `driver` (
  `driverId` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(512) DEFAULT NULL,
  `lastname` varchar(512) DEFAULT NULL,
  `emailId` varchar(512) DEFAULT NULL,
  `mobileNumber` varchar(512) NOT NULL,
  `userPassword` varchar(512) DEFAULT NULL,
  `locationMasterId` int DEFAULT NULL,
  `stateMasterId` int DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `identitytype` int DEFAULT NULL,
  `identitynumber` varchar(512) DEFAULT NULL,
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`driverId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `drivertransportermapping`;
CREATE TABLE `drivertransportermapping` (
  `drivertransportermappingId` int NOT NULL AUTO_INCREMENT,
  `driverId` int NOT NULL,
  `userId` int NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`drivertransportermappingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `locationmaster`;
CREATE TABLE `locationmaster` (
  `locationMasterId` int NOT NULL AUTO_INCREMENT,
  `locationName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `stateMasterId` int DEFAULT NULL,
  PRIMARY KEY (`locationMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `mastertype`;
CREATE TABLE `mastertype` (
  `masterTypeId` int NOT NULL AUTO_INCREMENT,
  `masterType` varchar(512) DEFAULT NULL,
  `sourceType` varchar(512) DEFAULT NULL,
  `destinationType` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`masterTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `mileagemaster`;
CREATE TABLE `mileagemaster` (
  `mileageId` int NOT NULL AUTO_INCREMENT,
  `containerId` int DEFAULT NULL,
  `weightId` int DEFAULT NULL,
  `mileage` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`mileageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `notificationId` int NOT NULL AUTO_INCREMENT,
  `notificationType` varchar(512) DEFAULT NULL,
  `notificationDesc` varchar(512) DEFAULT NULL,
  `orderId` int NOT NULL,
  `bidId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT NULL,
  `assignedToRole` int DEFAULT NULL,
  `assignedToUser` int DEFAULT NULL,
  PRIMARY KEY (`notificationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `orderTypeId` int DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `masterTypeId` int DEFAULT NULL,
  `sourceId` int DEFAULT NULL,
  `destinationId` int DEFAULT NULL,
  `sourceType` varchar(512) DEFAULT NULL,
  `destinationType` varchar(512) DEFAULT NULL,
  `orderRemarks` varchar(512) DEFAULT NULL,
  `orderAddress` varchar(512) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  `orderStatus` varchar(512) DEFAULT NULL,
  `orderStatusId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `totalRate` int DEFAULT NULL,
  `profitRate` int DEFAULT NULL,
  `portTerminalId` int DEFAULT NULL,
  `profitMarginPercentage` int DEFAULT NULL,
  `rateExcludingProfit` int DEFAULT NULL,
  `timeslotMasterId` int DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permissionId` int NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(512) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `permissionrolemapping`;
CREATE TABLE `permissionrolemapping` (
  `permissionroleId` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `roleId` int NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`permissionroleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `portcfsratemaster`;
CREATE TABLE `portcfsratemaster` (
  `portCfsRateMasterId` int NOT NULL AUTO_INCREMENT,
  `portMasterId` int NOT NULL,
  `cfsMasterId` int NOT NULL,
  `weightMasterId` int NOT NULL,
  `rate` int NOT NULL,
  `bidMarginRate` int DEFAULT NULL,
  `orderMarginRate` int DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `containerMasterId` int NOT NULL,
  PRIMARY KEY (`portCfsRateMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `portmaster`;
CREATE TABLE `portmaster` (
  `portMasterId` int NOT NULL AUTO_INCREMENT,
  `portName` varchar(512) DEFAULT NULL,
  `stateMasterId` int DEFAULT NULL,
  `locationMasterId` int DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `primarycontactperson` varchar(512) DEFAULT NULL,
  `primarycontactnumber` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`portMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `portterminalmaster`;
CREATE TABLE `portterminalmaster` (
  `portTerminalId` int NOT NULL AUTO_INCREMENT,
  `portMasterId` int DEFAULT NULL,
  `terminal` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`portTerminalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `settingsId` int NOT NULL AUTO_INCREMENT,
  `settingsName` varchar(512) DEFAULT NULL,
  `settingsValue` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`settingsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `statemaster`;
CREATE TABLE `statemaster` (
  `stateMasterId` int NOT NULL AUTO_INCREMENT,
  `stateName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`stateMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `statusdetails`;
CREATE TABLE `statusdetails` (
  `statusDetailsId` int NOT NULL AUTO_INCREMENT,
  `statusMasterId` int NOT NULL,
  `statusDetailsName` varchar(512) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`statusDetailsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `statusmaster`;
CREATE TABLE `statusmaster` (
  `statusMasterId` int NOT NULL AUTO_INCREMENT,
  `statusMasterName` varchar(512) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`statusMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `suborder`;
CREATE TABLE `suborder` (
  `subOrderId` int NOT NULL AUTO_INCREMENT,
  `orderId` int DEFAULT NULL,
  `subOrderTotal` int DEFAULT NULL,
  `BidScheduleId` int DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `cotainerId` int DEFAULT NULL,
  `containerType` varchar(512) DEFAULT NULL,
  `containerWeightType` int DEFAULT NULL,
  `subOrderTotalMargin` int DEFAULT NULL,
  `marginPercent` int DEFAULT NULL,
  `bidLimit` int DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `CutOffTime` datetime DEFAULT NULL,
  `suborderStatus` varchar(512) DEFAULT NULL,
  `suborderStatusId` int DEFAULT NULL,
  PRIMARY KEY (`subOrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `timeslotmaster`;
CREATE TABLE `timeslotmaster` (
  `timeslotMasterId` int NOT NULL AUTO_INCREMENT,
  `fromValue` varchar(512) NOT NULL,
  `toValue` varchar(512) NOT NULL,
  `actualValue` varchar(512) NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`timeslotMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `transporterregistration`;
CREATE TABLE `transporterregistration` (
  `transporterId` int NOT NULL AUTO_INCREMENT,
  `transporterName` varchar(512) DEFAULT NULL,
  `transporterMobileNumber` varchar(512) DEFAULT NULL,
  `transporterEmail` varchar(512) DEFAULT NULL,
  `transporterAddress` varchar(512) DEFAULT NULL,
  `transporterPincode` varchar(512) DEFAULT NULL,
  `transporterGSTIN` varchar(512) DEFAULT NULL,
  `transporterPAN` varchar(512) DEFAULT NULL,
  `transporterPartner` varchar(512) DEFAULT NULL,
  `transporterPartnerPAN` varchar(512) DEFAULT NULL,
  `transporterPartnerAddress` varchar(512) DEFAULT NULL,
  `transporterBankAccNumber` varchar(512) DEFAULT NULL,
  `transporterBankAccType` varchar(512) DEFAULT NULL,
  `transporterBankName` varchar(512) DEFAULT NULL,
  `transporterBankBranch` varchar(512) DEFAULT NULL,
  `transporterBankIFSC` varchar(512) DEFAULT NULL,
  `transporterAddressFile` varchar(512) DEFAULT NULL,
  `transporterGstFile` varchar(512) DEFAULT NULL,
  `transporterPanFile` varchar(512) DEFAULT NULL,
  `transporterPermitFile` varchar(512) DEFAULT NULL,
  `transporterLicenseFile` varchar(512) DEFAULT NULL,
  `transporterOtherFile` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`transporterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `trip`;
CREATE TABLE `trip` (
  `tripId` int NOT NULL AUTO_INCREMENT,
  `subOrderId` int DEFAULT NULL,
  `sourceId` int DEFAULT NULL,
  `destinationId` int DEFAULT NULL,
  `assignedVehicle` int DEFAULT NULL,
  `assignedDriver` int DEFAULT NULL,
  `tripstatus` varchar(512) DEFAULT NULL,
  `tripStatusId` int DEFAULT NULL,
  `destinationName` varchar(512) DEFAULT NULL,
  `sourceName` varchar(512) DEFAULT NULL,
  `vehicleNumber` varchar(512) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `billedAmount` int DEFAULT NULL,
  `BidValue` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `startedBy` int DEFAULT NULL,
  `stoppeddBy` int DEFAULT NULL,
  PRIMARY KEY (`tripId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `truck`;
CREATE TABLE `truck` (
  `truckId` int NOT NULL AUTO_INCREMENT,
  `containerId` int DEFAULT NULL,
  `truckNumber` varchar(512) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`truckId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `email` varchar(512) NOT NULL,
  `password` varchar(512) NOT NULL,
  `firstName` varchar(512) NOT NULL,
  `lastName` varchar(512) NOT NULL,
  `mobileNumber` varchar(512) NOT NULL,
  `typeSyscode` int NOT NULL,
  `permissions` text,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `user` (`userId`, `email`, `password`, `firstName`, `lastName`, `mobileNumber`, `typeSyscode`, `permissions`) VALUES
(2,	'bhushan@cfs.com',	'$2a$10$Z.3RPeSiMpMBs7hQP4ajVeJyx8ME4QJ9.gVIGpPZUpAtdI72Wks7i',	'Bhushan',	'Gadekar',	'9886631264',	4,	'[\"AccessAuthFeature\"]');

DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `roleId` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(512) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `parentRoleId` int DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `userrolemapping`;
CREATE TABLE `userrolemapping` (
  `userroleId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `roleId` int NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`userroleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `vehicleId` int NOT NULL AUTO_INCREMENT,
  `vehicleNumber` varchar(512) DEFAULT NULL,
  `desc` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`vehicleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `vehiclemaster`;
CREATE TABLE `vehiclemaster` (
  `vehicleMasterId` int NOT NULL AUTO_INCREMENT,
  `vehicleNumber` varchar(512) DEFAULT NULL,
  `vehicleType` int DEFAULT NULL,
  `vehicleCapacity` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `manufactureYear` varchar(512) DEFAULT NULL,
  `stateId` int DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`vehicleMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `vehicletransportermapping`;
CREATE TABLE `vehicletransportermapping` (
  `vehicletransportermappingId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `vehicleMasterId` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdBy` int NOT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  PRIMARY KEY (`vehicletransportermappingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `weightmaster`;
CREATE TABLE `weightmaster` (
  `weightMasterId` int NOT NULL AUTO_INCREMENT,
  `weightDesc` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `containerMasterId` int DEFAULT NULL,
  PRIMARY KEY (`weightMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `yardcfsratemaster`;
CREATE TABLE `yardcfsratemaster` (
  `yardCfsRateMasterId` int NOT NULL AUTO_INCREMENT,
  `cfsMasterId` int DEFAULT NULL,
  `yardMasterId` int DEFAULT NULL,
  `containerMasterId` int DEFAULT NULL,
  `weightMasterId` int DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `bidMarginRate` int DEFAULT NULL,
  `orderMarginRate` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `portMasterId` int DEFAULT NULL,
  PRIMARY KEY (`yardCfsRateMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `yardmaster`;
CREATE TABLE `yardmaster` (
  `yardMasterId` int NOT NULL AUTO_INCREMENT,
  `yardName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `portMasterId` int DEFAULT NULL,
  `locationMasterId` int DEFAULT NULL,
  `stateMasterId` int DEFAULT NULL,
  `primarycontactperson` varchar(512) DEFAULT NULL,
  `primarycontactnumber` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`yardMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `zonedaymaster`;
CREATE TABLE `zonedaymaster` (
  `zoneDayMasterId` int NOT NULL AUTO_INCREMENT,
  `zoneName` varchar(512) DEFAULT NULL,
  `portId` int DEFAULT NULL,
  `import` datetime DEFAULT NULL,
  `export` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`zoneDayMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `zonemaster`;
CREATE TABLE `zonemaster` (
  `zoneMasterId` int NOT NULL AUTO_INCREMENT,
  `zoneName` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `zoneDesc` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`zoneMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- 2020-08-24 09:24:49
