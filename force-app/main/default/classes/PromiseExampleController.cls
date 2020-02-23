public class PromiseExampleController {

    //@AuraEnabled
    public static Boolean getPrivateData() {
        return PromiseExample__c.getInstance().IsPrivate__c ;
    }
    
    @AuraEnabled
    public static Contact getContactById (String contactId) {
        return [SELECT Id, Name, Email FROM Contact WHERE Id =: contactId];
    }
}