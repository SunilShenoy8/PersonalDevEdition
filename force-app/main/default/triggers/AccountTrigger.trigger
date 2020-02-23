trigger AccountTrigger on Account (before insert, after insert, before delete) {
    if(Trigger.isBefore) 
    {
        if(Trigger.isInsert) {
            
        }
        
        if(Trigger.isUpdate) {
            
        }
        
        if(Trigger.isDelete) 
        {
            List<Account> accList=Trigger.Old;
            List<Contact> conList=[select id,AccountId from Contact];
            
                for(Account a:accList)
                {
                    List<Contact> tempList=new List<Contact>();
                    for(Contact c:conList)
                    {
                        if(a.id==c.AccountId)
                        {
                            tempList.add(c);
                        }
                    }
                    delete tempList;
                }
        }
    }
    
    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            AccountTriggerHandler.createContacts(Trigger.new);
        }
        
        if(Trigger.isUpdate) {
            
        }
        
        if(Trigger.isDelete) {
            
        }
    }
}