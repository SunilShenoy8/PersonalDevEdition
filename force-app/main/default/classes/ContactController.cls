public class ContactController {
    @AuraEnabled
    public static List<Contact> loadContacts(String accountId){
        return [SELECT Id, Name, Phone, Email, MailingStreet,Title FROM Contact WHERE AccountId =:accountId ];
    }
}