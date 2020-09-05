/*
-- Query: SELECT * FROM transporter.bidschedulemaster
LIMIT 0, 1000

-- Date: 2020-08-30 17:04
*/
INSERT INTO `bidschedulemaster` (`BidScheduleId`,`FromHour`,`ToHour`,`BidingHours`,`WorkingHours`,`GraceHours`,`BidCountUpto`,`IsActive`,`TotalBidHour`,`IsFullHour`) VALUES (1,2,6,1,0,1,20,1,NULL,NULL);
INSERT INTO `bidschedulemaster` (`BidScheduleId`,`FromHour`,`ToHour`,`BidingHours`,`WorkingHours`,`GraceHours`,`BidCountUpto`,`IsActive`,`TotalBidHour`,`IsFullHour`) VALUES (2,6,12,3,0,1,20,1,NULL,NULL);
INSERT INTO `bidschedulemaster` (`BidScheduleId`,`FromHour`,`ToHour`,`BidingHours`,`WorkingHours`,`GraceHours`,`BidCountUpto`,`IsActive`,`TotalBidHour`,`IsFullHour`) VALUES (3,12,24,8,0,1,20,1,NULL,NULL);
INSERT INTO `bidschedulemaster` (`BidScheduleId`,`FromHour`,`ToHour`,`BidingHours`,`WorkingHours`,`GraceHours`,`BidCountUpto`,`IsActive`,`TotalBidHour`,`IsFullHour`) VALUES (4,24,48,6,8,1,20,1,6,NULL);
INSERT INTO `bidschedulemaster` (`BidScheduleId`,`FromHour`,`ToHour`,`BidingHours`,`WorkingHours`,`GraceHours`,`BidCountUpto`,`IsActive`,`TotalBidHour`,`IsFullHour`) VALUES (5,48,96,12,8,1,20,1,28,0);
INSERT INTO `bidschedulemaster` (`BidScheduleId`,`FromHour`,`ToHour`,`BidingHours`,`WorkingHours`,`GraceHours`,`BidCountUpto`,`IsActive`,`TotalBidHour`,`IsFullHour`) VALUES (6,96,144,24,8,1,20,1,72,1);
INSERT INTO `bidschedulemaster` (`BidScheduleId`,`FromHour`,`ToHour`,`BidingHours`,`WorkingHours`,`GraceHours`,`BidCountUpto`,`IsActive`,`TotalBidHour`,`IsFullHour`) VALUES (7,144,360,42,8,1,20,1,122,0);
