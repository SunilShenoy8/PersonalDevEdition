@isTest(seeAllData=false)
public class ContinuosIntegrationTest{
    public static testMethod void getAccountsTest(){
        ContinuosIntegration.fetchAllAccounts();
        Account ac = new Account(name='abc');
        insert ac;
        System.debug('account created : '+ac.Id);
    }
}