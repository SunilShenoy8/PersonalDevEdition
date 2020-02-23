trigger LeadAutomaticAssignmentTrigger on Lead (before insert) {
	if(Trigger.isBefore)
	{
		if(Trigger.isInsert)
		{
			LeadAutomaticTriggerHandler.handle(Trigger.new);
		}
	}

}