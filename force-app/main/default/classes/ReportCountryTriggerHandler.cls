public class ReportCountryTriggerHandler {
    public static void updateCountryName(List<Opportunity> oppList)
    {
        for(Opportunity op:oppList)
        {
            for(Account a:[select id,Country_code__c from Account])
            {
                if(a.id==op.AccountId)
                {
                    for(Reporting_Country__c rc:[select Name,Capital__c from Reporting_Country__c where Country_code__c=:a.Country_code__c])
                    {
                        op.Country_Name__c=rc.Name;
                    }
                }
            }
        }
        
    }

}