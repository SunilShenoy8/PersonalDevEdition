trigger ReportCountryMatch on Opportunity (before insert,before update) {
    if(Trigger.isBefore)
    {
        if(Trigger.isInsert || Trigger.isUpdate)
        {
            ReportCountryTriggerHandler.updateCountryName(Trigger.New);
        }
    }

}