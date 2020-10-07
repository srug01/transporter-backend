SELECT * FROM transporter.order;
Select * From transporter.suborder; 
Select * from transporter.container;
select * from transporter.truck;
Select * From transporter.bid;
Select * from transporter.user;
Select * from transporter.trip;

Select Now();

Select * from transporter.bidusermapping; 




Select * from transporter.driver;
Select * from transporter.yardmaster;
select * from transporter.portmaster;

select * from transporter.cfsuserregistration;

Select * from transporter.weightmaster;

call GetBidsbyUserId(1);
Call procSchedulerConfirmBid();
Call procGetOrderDetails(null);
Call getAllCFSContainersbyUserId(9,1,1);
Call GetAllCFSbyUserId(9);
Call getDashboardForAdmin(1);
Call getDashboardForCFS(20);
Call getDashboardForTransporter(11);
Call getDashboardForDriver(23);
Call GetAllTripsbyUserId(29);
Call GetAllSubOrdersbyUserId(14);
Call GetTripDetailsbyTripId(1);
Call GetBidsbyUserId(1);
Call GetAllOrdersbyUserId(9);
Call GetAllSubOrdersbyUserId(1);
Call GetAllTripsbyUserId(1);
Call procGetOrderDetails(8);
Call getBidListForFilters(8,0,0);
Call getTripsListForFilters(8,0,0,0,0,0);
Call repTreeViewOrder();
Call GetAllCFSPortsbyUserId(4);
Call CleanOrders();
Call GetTripsbyId(4);
Call GetTripDetailsbyTripId(4);
Call getBidsforBidding(6);
Call GetAllCFSContainerAndWeights(3,1);

-- declare @total int, @retVal varchar(150) 
Call getOrderListForAdmin(0,0,'',0,0,9);
Call getSubOrderListForFilters(2,'','',0,0,0);
Call getOrderListForFilters(0,0,'','',0,0,0,12);

Select @total,@retVal;



-- UPDATE `transporter`.`bidschedulemaster` SET `TotalBidHour` = '6' WHERE (`BidScheduleId` = '4');
Update transporter.suborder set BidscheduleId = null, CutOffTime = null where orderId <> 1;

Select * from transporter.statusMaster; -- 1 bid 2 bidsuer 3 order 4 suborder 5 trip
Select * from transporter.StatusDetails;
Delete from transporter.user where userId <> 1;
Select * from transporter.container;
Select * from transporter.truck;
Select * from transporter.timeslotmaster;

baseUri : 'http://ec2-34-232-62-121.compute-1.amazonaws.com:3000/'
transporter-backend_mysql_db_container_1
