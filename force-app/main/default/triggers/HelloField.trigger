trigger HelloField on Account (before insert,before update) {
    
    List<Account> accList=Trigger.New;
    for(Account a:accList)
    {
        String word=a.Hello__c;
        if(word.equalsIgnoreCase('world'))
        {
            a.Hello__c=a.Name+' '+123;
        }
    }

}