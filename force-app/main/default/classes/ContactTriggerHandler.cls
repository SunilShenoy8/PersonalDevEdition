public class ContactTriggerHandler {
    public void handleInsert(Map<Id,Contact> newMap){
        Set<Id> accIds = new Set<Id>();
        Set<Id> conIds = new Set<Id>();
        List<Contact> conList = new List<Contact>();
        
        for(Contact con: newMap.values()){
            if(con.Amount__c > 1000 && con.Amount__c != null){
                accIds.add(con.AccountId);
            }
            
            conIds.add(con.Id);
        }
        
		conList = [select id, email from contact where id In: conIds] ;  
        for(Contact con: conList){
            con.email = 'test1234@gmail.com';
        }
        update conList;
        
        if(accIds.size() > 0){
            updateRelatedAccounts(accIds);
        }
	}
    
    public void handleUpdate(Map<Id,Contact> newMap, Map<Id,Contact> oldMap){
        Set<Id> accIds = new Set<Id>();
        for(Contact con: newMap.values()){
            if(oldMap.get(con.id) != null && oldMap.get(con.id).Amount__c < con.Amount__c){
                accIds.add(con.AccountId);
            }
            con.Email = 'test1234@gmail.com';
        }
        
        if(accIds.size() > 0){
            updateRelatedAccounts(accIds);
        }
    }
    
    public static void updateRelatedAccounts(set<Id> accIds){
        /*List<Account> accList = [select id, Industry From Account where id in: accIds];
        for(Account acc: accList){
            acc.Industry = 'Banking';
        }
        List<Database.SaveResult> srList = Database.update(accList, false);
        for(Database.SaveResult sr: srList){
            if(sr.isSuccess()){
                System.debug('Successfully updated : '+sr.getId());
            }
        }*/
        
        List<AggregateResult > conList = [select accountId, sum(amount__c) from contact group by accountId];
		for(AggregateResult  c:conList){
    		System.debug('c : '+c);
            
		}
    }
    
    
    public void rollupOnInsert(List<Contact> conList){
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        for(Contact con: conList){
            accIds.add(con.AccountId);
        }
        
        if(accIds.size() > 0 ){
            for(Account acc: [SELECT Id, Total_Contacts__c ,Contact_Amount__c , (SELECT id, Amount__c  from Contacts) from Account where id in: accIds]){
                acc.Total_Contacts__c = acc.contacts.size();
                acc.Contact_Amount__c = acc.Contact_Amount__c == null ? 0 : acc.Contact_Amount__c;
                if(acc.contacts.size() > 0){
                    Double d =0;
                    for(Contact c:acc.contacts){
                        System.debug('contact amount : '+c.Amount__c+' acc.Contact_Amount__c  : '+acc.Contact_Amount__c );
                        if(c.Amount__c != null && c.Amount__c != 0){
                            d += c.Amount__c;
                        }
                    }
                    acc.Contact_Amount__c = d;
                }
                accList.add(acc);
            }
        }
        
        if(accList.size() > 0 ){
            update accList;
        }
    }
    
    public void rollupOnDelete(List<Contact> conList){
        Map<Id,Account> accMap ;
        Set<Id> accIds = new Set<Id>();
        List<Account> accList = new List<Account>();
        for(contact c:conList){
            accIds.add(c.AccountId);
        }
        
        if(accIds.size() > 0 ){
            accMap = new Map<Id,Account>([SELECT Id, Total_Contacts__c ,Contact_Amount__c , (SELECT id, Amount__c,AccountId  from Contacts) from Account where id in: accIds]);
            System.debug('accMap : '+accMap);
            
            for(Contact c: accMap.values().contacts){
                accMap.get(c.AccountId).Total_Contacts__c = accMap.values().contacts.size();
                if(c.AccountId == accMap.get(c.AccountId).Id){
                    accMap.get(c.AccountId).Contact_Amount__c = accMap.get(c.AccountId).Contact_Amount__c - c.Amount__c;
                }
                accList.add(accMap.get(c.AccountId));
            }
        }
		        
        if(accList.size() > 0 ){
            update accList;
        }
    }
}