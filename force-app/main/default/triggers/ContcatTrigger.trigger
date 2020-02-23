trigger ContcatTrigger on Contact (after insert, before update, before delete){
    
    if(Trigger.isAfter && Trigger.isInsert){
        new ContactTriggerHandler().handleInsert(Trigger.newMap);
        new ContactTriggerHandler().rollupOnInsert(Trigger.new);
    }
    
    if( trigger.isAfter && trigger.isDelete){
        new ContactTriggerHandler().rollupOnDelete(Trigger.old);
    }
    
    if(Trigger.isBefore && Trigger.isUpdate){
        new ContactTriggerHandler().handleUpdate(Trigger.newMap,Trigger.oldMap);
    }
    
    if(Trigger.isBefore && Trigger.isDelete){
        Set<Id> accIds = new Set<Id>();
        for(Contact con: Trigger.Old){
              accIds.add(con.AccountId);
        }
        
        List<Account> accList = [select id, Industry From Account where id in: accIds];
        for(Account acc: accList){
            acc.Industry = 'Agriculture';
        }
        List<Database.SaveResult> srList = Database.update(accList, false);
        for(Database.SaveResult sr: srList){
            if(sr.isSuccess()){
                System.debug('Successfully updated : '+sr.getId());
            }
        }
    }
}