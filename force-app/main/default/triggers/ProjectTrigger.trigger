trigger ProjectTrigger on Project__c (before insert,before update)
{
    if(Trigger.isBefore)
    {
        if(Trigger.isInsert || Trigger.isUpdate)
            ProjectTriggerHandler.roundRobinSectionNum(Trigger.New);
    }
	
}