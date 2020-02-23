public class sampleCon {
        List<Account> acList{get;set;}
    	public List<Account> getAccounts()
        {
            new List<Account>();
            acList=[select name from account];
            return acList;
        }
}