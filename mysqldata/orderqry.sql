SELECT * FROM transporter.order;
Select * From transporter.suborder; 
Select * From transporter.bid;
Select * from transporter.user;
Select * from transporter.trip;

Call procSchedulerConfirmBid();
Call procGetOrderDetails(null);
Call GetAllTripsbyUserId(11);
Call GetAllSubOrdersbyUserId(14);

Select transporter.bidusermapping.* from transporter.bidusermapping; 

Update transporter.suborder set BidscheduleId = null, CutOffTime = null where orderId <> 1;

Select * from transporter.statusMaster; -- 1 bid 2 bidsuer 3 order 4 suborder 5 trip
Select * from transporter.StatusDetails;
Select * from transporter.user;
Select * from transporter.container;
Select * from transporter.truck;
Select * from transporter.timeslotmaster;