/* Created By 	: Sunil Shenoy
 * Purpose 		: Helper class for Visualforce page
 * Date 		: 13/12/2018 */
public class AG_AccountsWithContactsPageHelper {
    public static Integer Page_Limit{get;set;}
    public static List<Account> Accounts{get;set;}
    public List<SelectOption>  pageSizeOpts{get; set;}
    
    public AG_AccountsWithContactsPageHelper(){   
        // Initialize account List
        Accounts = new List<Account>();
        
        //Set the select list options
        pageSizeOpts = new List<SelectOption>();
        pageSizeOpts.add(new SelectOption('10','10'));
        pageSizeOpts.add(new SelectOption('50','50'));
        pageSizeOpts.add(new SelectOption('100','100'));
        pageSizeOpts.add(new SelectOption('100','500'));
        pageSizeOpts.add(new SelectOption('100','1000'));
        
        //Default Page size/Limit
        Page_Limit = 10;
    }
    
    /* Functionality : Fetches the specified no of Account with related contacts from the Apex rest Webservice to display in VF Page, in case of any exception returns empty list */
    public static void getAccounts(){
        try{
            Http http = new Http();
            HttpRequest request  = new HttpRequest();
            request.setMethod('GET');
            request.setEndpoint('callout:AG_Usecase_Credentials/services/apexrest/AccountsWithRelatedContacts?Page_Size='+Page_Limit); // Base url is stored in Named Credentials
            request.setHeader('Authorization', 'Bearer '+UserInfo.getSessionId());
            request.setHeader('Content-Type','application/json');
            HttpResponse response = http.send(request);
            
            while (response.getStatusCode() == 302) {
                request.setEndpoint(response.getHeader('Location'));
                response = new Http().send(request);
            }
            if(response.getStatusCode() == 200){
                System.debug('JSON of Accounts with related Contacts: '+response.getBody());
                Accounts = (List<Account>) JSON.deserialize(response.getBody(), List<Account>.class);
            }
        }
        catch(Exception e){
            System.debug('Exception details : '+e.getMessage());
        }
    } 
}