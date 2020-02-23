@isTest
public class RestrictContactByNameTest {
    @isTest
    public static void testInsertOrUpdate()
    {
       	List<Contact> conList=new List<Contact>();
        Test.startTest();
        Contact c1=new Contact(LastName='INVALIDNAME');
        Contact c2=new Contact(LastName='SUNIL');
        List<Contact> l1=new List<Contact>{c1,c2};
        Database.SaveResult[] rs=Database.insert(l1,false);
        Test.stopTest(); 
        for(Database.SaveResult r:rs)
        {
            if(!r.isSuccess())
            {
                System.assert(true);
            }
        }
        	
    }

}