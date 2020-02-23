trigger AccountChangeHandler on AccountChange__e (after insert) {
	List<AccountChange__e> accountChanges = trigger.new;
    List<Account> listAcc = new List<Account>();
    if(!accountChanges.isEmpty()){
        for(AccountChange__e ach : accountChanges){
			Account ac = new Account();
        	ac.Name = 'PE Change -'+ach.createdDate;
			ac.Type = ach.status__c == 'Good' ? 'Customer - Direct' : 'Prospect'   ;
            ac.Description = ach.description__c;
            ac.Total_Opp_Amount__c = ach.amount__c;
            listAcc.add(ac);
        }
        
        if(!listAcc.isEmpty()){
            insert listAcc;
        }
       
    }
}