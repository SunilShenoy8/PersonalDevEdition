/* Created By 	: Sunil Shenoy
 * Purpose 		: Unit testing apex class for the given use-case
 * Date 		: 13/12/2018 */
@isTest(SeeAllData=false)
public class AG_ApexUnitTest {
    
    /* Functionality : Test setup method to create a Account and Related Contact for testing */
    @testSetup 
    static void setup() {
        Account accountObj = new Account(Name = 'test Account');
        insert accountObj;
        Contact contactObj = new Contact(LastName = 'test Contact',
                                         AccountId = accountObj.Id, 
                                         Email='test123@gmail.com',
                                         Phone='1234567890');
        insert contactObj;      
    }

	/* Functionality : Apex method to test related apex classes such as 'AG_AccountsWithRelatedContacts' and 'AG_AccountsWithContactsPageHelper' */
    static testMethod void testEverything(){
        RestRequest request = new RestRequest();
        request.requestUri = Label.AG_Endpoint_URL+'/services/apexrest/AG_AccountsWithRelatedContacts?Page_Size=10';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Test.startTest();
        List<Account> accounts = AG_AccountsWithRelatedContacts.getAccounts();
        AG_AccountsWithContactsPageHelper.getAccounts();
        new AG_AccountsWithContactsPageHelper();
        Test.stopTest();
        // Verify results
        System.assert(accounts != null && accounts.size() > 0);
    }
}