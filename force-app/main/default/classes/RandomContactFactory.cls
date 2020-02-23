public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer noOfContacts, String Lname)
    {
        List<Contact> returnConList=new List<Contact>();
        for(Integer i=01;i<=noOfContacts;i++)
        {
            Contact c=new Contact(FirstName=' '+i,LastName=Lname);
            System.debug(c.FirstName+' ' +c.LastName);
            returnConList.add(c);
        }
        return returnConList;
    }

}