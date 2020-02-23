public class MyController {
    public final Account ac;
    public MyController()
    {
        ac=[select Id,Name,Site from Account where 
           Id=: ApexPages.currentPage().getParameters().get('id')];
    }
    public Account getAccount()
    {
        return ac;
    }
    public PageReference save()
    {
        update ac;
        return null;
    }

}