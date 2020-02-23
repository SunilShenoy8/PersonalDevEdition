trigger ExtractMonth on Opportunity (before insert,before update) {
	if(Trigger.isBefore)
    {
        if(Trigger.isInsert || Trigger.isUpdate)
        {
            for(Opportunity op:Trigger.new)
            {
                String dateStr=String.valueOf(op.CloseDate);
                System.debug(Integer.valueOf(dateStr.substring(5, 7)));
            }
        }
    }
}