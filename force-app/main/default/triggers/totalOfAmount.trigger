trigger totalOfAmount on Contact (after insert,after update) 
{

    List<Contact> conList=Trigger.New;
    List<Account> accList=new List<Account>();
    if(Trigger.isInsert || Trigger.isUpdate)
    {
    	for(Account a:accList)
    	{
        	Decimal amount=0;
        	for(Contact c:conList)
        	{
            	if(a.Id==c.AccountId)
            	{
                	amount=amount+c.Amount__c;
             	}
    		}
            a.Contact_Amount__c=amount;
    	}
    }
}