public class IntergrationSample {
    
    public String username = 'logicapps@shell.com.internal';
    public String password = 'Indian!123O7VgGxgyzQ52s01bzYkLCL8u';
    public String consumerKey ='3MVG9GXbtnGKjXe7lc514yJ9a8KoKNwPyRnm7R4Ud5TBRw5wfkU1WABPVVZ7qFJtudX5Qae_OGoqDjj3s0Lg6';
    public String consumerToken = 'A91FEAFEB31BABBB105BEBC7A8878B438697B4E65BD9669D374263F261AFAE5F';
	public String endPoint = 'https://test.salesforce.com';
    public String sObjectApiName = 'Credit_Report__c';
    
    /*public void getDataFromHeruku(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');
        
        HttpResponse res = new Http().send(req);
        
        if(res.getStatusCode() == 200){
            System.debug('getDataFromHeruku >> Response : '+res.getBody());
            Map<String, Object> receivedData = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            for(Object keyVal : (List<Object>)receivedData.get('animals')){
                System.debug('Key : '+keyVal);
            }
        }else{
            System.debug('getDataFromHeruku >> Response : '+res.getBody());
        }
    }
    public void setDataToHeruku(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        req.setBody('{"name" : "Monkey"}');
        
        HttpResponse res = new Http().send(req);
        
        if(res.getStatusCode() == 200){
            System.debug('getDataFromHeruku >> Response : '+res.getBody());
        }else{
            System.debug('getDataFromHeruku >> Response : '+res.getBody());
        }
    }*/
    
    // Connect to other salesforce org
    public OAuth2 getOAuth2Details(String endPoint, String consumerKey, String consumerSecret, string username, String password){ // password + security token is must
        String reqbody = 'grant_type=password&client_id='+consumerKey+'&client_secret='+consumerSecret+'&username='+username+'&password='+password;
		
        Http http = new Http();
        HttpRequest request  = new HttpRequest();
        request.setMethod('POST');
        request.setBody(reqbody);
        request.setEndpoint(endPoint+'/services/oauth2/token');
        HttpResponse response = http.send(request);
        
        System.debug('response : '+response);
        OAuth2 objAuthenticationInfo = (OAuth2)JSON.deserialize(response.getbody(), OAuth2.class);
        return objAuthenticationInfo;
    }
    
    // fetch account from another org
    public void getSobjectDetails(){
        OAuth2 authInfo = getOAuth2Details(this.endPoint, this.consumerKey, this.consumerToken, this.username, this.password);
    	if(authInfo.access_token != null){
            Http http = new Http();
        	HttpRequest request  = new HttpRequest();
            request.setMethod('GET');
            request.setEndpoint('https://wdt-test-dev-ed.my.salesforce.com/services/data/v39.0/sobjects/'+this.sObjectApiName);
            request.setHeader('Authorization', 'Bearer '+authInfo.access_token);
            request.setHeader('Content-Type','application/json');
            
            HttpResponse response = http.send(request);
            
            System.debug(sObjectApiName+' details of MY ORG : '+response.getBody());
            
        }
    }    
        
    public class OAuth2{
        public String id{get;set;}
        public String issued_at{get;set;}
        public String instance_url{get;set;}
        public String signature{get;set;}
        public String access_token{get;set;}    
    }
    
    /* DETAILS FROM CONNECTED APP
    
    Consumer Scret : 
    6795644660021969793
    
    Consumer key : 
    3MVG9d8..z.hDcPIlxwhbaEzDxYTwemDpyIKG0GCa1vl5JY6kYcQaBl1loIqsUNX0eRouunBJM0HnaxQaXMF1
    
    User Name :
    sunil@warpdrivetech.in
    
    Password:
    linus940318 + CwoBN8F9bRDLCLoCalbktTOD
    
    Remote site URL :
    https://wdt-test-dev-ed.my.salesforce.com */
 
}