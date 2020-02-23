/* Created By 	: Sunil Shenoy
 * Purpose 		: Apex class for Rest Webservice, which exposes Accounts with related contacts
 * Date 		: 13/12/2018 */
@RestResource(urlMapping='/AccountsWithRelatedContacts')
global with sharing class AG_AccountsWithRelatedContacts{
    // Default Limit to fetch the accounts
    global static Integer PAGE_SIZE = 100; 
    
    // Functionality : Webservice method to fetch the account and related contacts
    @HttpGet
    global static List<Account> getAccounts(){
        RestRequest request = RestContext.request;
        String pageSizeStr = request.params.get('Page_Size');
        Integer pageSizeNum = pageSizeStr == null ? PAGE_SIZE : Integer.valueOf(pageSizeStr);
        if(pageSizeNum == null || pageSizeNum <= 0){
            pageSizeNum = PAGE_SIZE;
        }
        
        return [SELECT Id,Name,(SELECT Id,Name,Email,Phone FROM Contacts) FROM Account LIMIT: pageSizeNum];
    }
}