public class CopyEmail {
    public static void copyEmailToContact(List<Contact> contactlist)
    {
        Set<Id> setOfContact =  new Set<Id>();
        List<Account> accList = new List<Account>();
        Map<Id,String> mapOfAccount = new Map<Id,String>();
        for(Contact c:contactlist)
        {
            setOfContact.add(c.AccountId);
        }
        accList = [select id,Email__c from Account where id=:setOfContact];
        for(Account a:accList)
        {
            mapOfAccount.put(a.id, a.Email__c);
        }
        for(Contact c:contactlist)
        {
            c.email=mapOfAccount.get(c.AccountId);
        }
      
    }
    public static void receiveValue(String val)
    {
        //Account a=new Account(Name='bye');
        //a.Phone=val;
        System.debug('done');
    }

}