public with sharing class AccountContactLWCHelper {
    public AccountContactLWCHelper() {}

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [select id,name from Account LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedContact(string accId){
        return [select id,lastname from Contact where AccountId =: accId];
    }
}