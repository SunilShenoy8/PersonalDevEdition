public class SumOfOppAmt {
    
    public static void sumOfAmount(List<Opportunity> oppList)
    {
        Set<Id> oppIdSet=new Set<Id>();
        
        for(Opportunity op:oppList)
        {
            oppIdSet.add(op.Id);
        }
        List<Account> accList = [select id,Total_Opp_Amount__c,(select id,Sub_Total__c,Amount from Opportunities) from Account where id in : oppIdSet];
        for(Account acc:accList)
        {
            Decimal amt=0;
            for(Opportunity op:acc.Opportunities)
            {
                Decimal sum=0;
                sum=op.Sub_Total__c+op.Amount;
                amt=sum;
            }
            acc.Total_Opp_Amount__c=amt;
            
        }
    }

}