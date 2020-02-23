public class PassSelectedIdsToFlowVFController {
    
    public string[] SelectedAccountIDs{get;set;}
    
    public PassSelectedIdsToFlowVFController(ApexPages.StandardSetController listcontroller){
        SelectedAccountIDs = new string[]{};
        for(Account acc : (Account[])listcontroller.getSelected()){
            SelectedAccountIDs.add(acc.Id);
        }
    }
}