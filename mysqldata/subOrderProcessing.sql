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
END