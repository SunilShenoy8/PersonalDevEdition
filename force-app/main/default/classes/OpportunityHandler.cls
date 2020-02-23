public class OpportunityHandler 
{
	public static void sumOfOppotunityAmount(List<Opportunity> oppList)
    {
        List<Account> accList=[select id,Total_Opp_Amount__c from Account];
        List<Account> updatedAccList=new List<Account>();
        for(Account ac:accList)
        {
            Decimal sum=0;
            for(Opportunity op:oppList)
            {
                if(ac.Id==op.AccountId)
                {
                    sum+=op.Amount;
                }
            }
            ac.Total_Opp_Amount__c=sum;
            updatedAccList.add(ac);
        }
        update updatedAccList;
    }
}