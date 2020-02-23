public class NoOfLoactionClass {
    public static void createContact(List<Account> accList)
    {
        List<Contact> conList = new List<Contact>();
        for(Account ac:accList)
        {
            Decimal sizOfContact = ac.No_Of_Locations__c;
            for(Decimal i=0;i<sizOfContact;i++)
            {
                Contact con1=new Contact();
                con1.lastname=ac.Name+i;
                con1.AccountId=ac.Id;
                conList.add(con1);
            }
        }
        insert conList;
        
    }

}