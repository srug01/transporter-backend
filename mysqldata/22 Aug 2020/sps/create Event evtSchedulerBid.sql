
use transporter;
create event if not exists evtSchedulerBid
	On Schedule every 5 minute
	starts current_timestamp + interval 5 second
	on completion preserve
Do
	call procSchedulerConfirmBid();



