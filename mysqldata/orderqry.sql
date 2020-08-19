SELECT * FROM transporter.order;
Select * From transporter.suborder; 
Select * From transporter.bid;
Select * from transporter.user;
Select * from transporter.trip;

Select * from transporter.bidusermapping; 
Select * from transporter.container;
select * from transporter.truck;
Select * from transporter.driver;
Select * from transporter.yardmaster;
select * from transporter.portmaster;

Call procSchedulerConfirmBid();
Call procGetOrderDetails(null);
Call getDashboardForAdmin(1);
Call getDashboardForCFS(20);
Call getDashboardForTransporter(11);
Call getDashboardForDriver(23);
Call GetAllTripsbyUserId(11);
Call GetAllSubOrdersbyUserId(14);
Call GetTripDetailsbyTripId(1);



-- UPDATE `transporter`.`bidschedulemaster` SET `TotalBidHour` = '6' WHERE (`BidScheduleId` = '4');
Update transporter.suborder set BidscheduleId = null, CutOffTime = null where orderId <> 1;

Select * from transporter.statusMaster; -- 1 bid 2 bidsuer 3 order 4 suborder 5 trip
Select * from transporter.StatusDetails;
Delete from transporter.user where userId <> 1;
Select * from transporter.container;
Select * from transporter.truck;
Select * from transporter.timeslotmaster;