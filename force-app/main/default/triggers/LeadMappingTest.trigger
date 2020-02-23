trigger LeadMappingTest on Lead (after insert,after update) {
	if(Trigger.isAfter)
	{
		if(Trigger.isInsert || Trigger.isUpdate)
		{
			LeadMappingHandler.mapLeadAndConvert(Trigger.New);
		}
	}

}