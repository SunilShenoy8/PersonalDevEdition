public class duplicateAccountClass {
    public static void checkDuplicate(List<Account> alist)
    {
        List<Account> blist = new List<Account>();
        for(Account a:alist)
        {
            blist=[select id from Account where name =:a.name];
            if(blist.size()>0)
        	{
            	a.adderror('Duplicate element found');
        	}
        }
        
    }

}