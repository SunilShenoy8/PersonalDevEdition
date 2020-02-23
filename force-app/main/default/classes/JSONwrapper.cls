//------------------
// Wrapper class
//---------------------------
public class JSONwrapper
{    
    public Integer totalSize;
    public boolean done;
    List<AccountWrapper> accWrapper = new List<AccountWrapper>();
    public Jsonwrapper(integer p_tot,boolean p_done,List<Account> p_rec)
    {
        totalSize=p_tot;
        done=p_done;
        for(Account acc : p_rec)
        {
            AccountWrapper aw = new AccountWrapper(acc.Name);
            List<ContactWrapper> conWrapper = new List<ContactWrapper>();
            for(Contact con : acc.Contacts)
            {
                ContactWrapper cw = new ContactWrapper(acc.Contacts.size(), true, con);
                conWrapper.add(cw);
            }
            aw.conList.addAll(conWrapper);
            accWrapper.add(aw);
        }
       
    }
    
    
    public class AccountWrapper
    {
        Public String name{get;set;}
        public List<ContactWrapper> conList{get;set;}
        
        public AccountWrapper(String n)
        {
            name = n;
            conList = new List<ContactWrapper>();
        }
    }
    
    public class ContactWrapper
    {
        public Integer totalSize;
        public boolean done;
        public contact record;
        
        public ContactWrapper(integer p_tot,boolean p_done,Contact p_rec)
        {
            totalSize=p_tot;
            done=p_done;
            record=p_rec;
        }
    }
}