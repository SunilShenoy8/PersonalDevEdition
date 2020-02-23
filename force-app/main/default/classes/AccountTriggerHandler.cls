public class AccountTriggerHandler {
    public static void createContacts(List<Account> newAccs) {
        List<Contact> newCons = new List<Contact>();
        for(Account acc : newAccs) {
            Contact con = new Contact();
            con.AccountId = acc.Id;
            newCons.add(con);
        }
        
        if(newCons.size() > 0) {
            insert newCons;
        }
    }
}