public class ProcessBuilderApexSample {
	@InvocableMethod
    public static void makeCallout(List<Id> accIds){
        System.debug('accIds : '+accIds);
        IntergrationSample.OAuth2 authInfo = IntergrationSample.getOAuth2Details('https://wdt-test-dev-ed.my.salesforce.com', '3MVG9d8..z.hDcPIlxwhbaEzDxYTwemDpyIKG0GCa1vl5JY6kYcQaBl1loIqsUNX0eRouunBJM0HnaxQaXMF1', '6795644660021969793', 'sunil@warpdrivetech.in', 'linus940318CwoBN8F9bRDLCLoCalbktTOD');
    	System.debug('authInfo : '+authInfo.access_token);
        if(authInfo.access_token != null){
            List<Account> accList = new List<Account>();
            for(Id idVal :accIds ){
                Account ac = new Account(Id = idVal, Rating = 'Hot');
                accList.add(ac);
            }
           
            if(accList.size() > 0){
                System.debug('Updateable list : '+accList);
                update accList;
            }
        }
    }
    
    
}