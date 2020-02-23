public class LightningTableApex {
	@AuraEnabled
    public static List<Account> getLimitedAccounts(){
        List<Account> accounts = [SELECT Id, Name, Phone, Rating, Active__c FROM Account ORDER BY CreatedDate LIMIT 2000];
        return accounts;
    }
}