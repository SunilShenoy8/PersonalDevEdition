public class OAuthDemoPageController{
    public String authorizationCode {get;set;}
    public String accessToken {get;set;}
    
    public transient blob attachmentBody {get;set;}
    public string attachmentName {get;set;}
    
    
    public OAuthDemoPageController(){
        authorizationCode = ApexPages.CurrentPage().getParameters().get('code');
    }
    
    public void getAccessToken(){
        String grantTypeString = 'grant_type=authorization_code';
        String authorizationCodeString = '&code='+authorizationCode;
        String clientIdString = '&client_id=849833114650-o288lfpv61mq9hvlogpvevjf3egecq02.apps.googleusercontent.com';
        String clientSecretString = '&client_secret=7sa9jg-JEgyhSFF3WSWqMGdS';
        String redirectURIString = '&redirect_uri=https://c.ap2.visual.force.com/apex/OAuthDemoPage';
        
        String requestBody = grantTypeString + authorizationCodeString + clientIdString + clientSecretString + redirectURIString;
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://www.googleapis.com/oauth2/v3/token');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setBody(requestBody );
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug('RESPONSE BODY---> '+res.getBody());
        
        
        GoogleAPIResponseWrapper googleResponse = (GoogleAPIResponseWrapper) JSON.deserialize(res.getBody(), GoogleAPIResponseWrapper.Class);
        accessToken = googleResponse.access_token;
    } 
    
    
    public void uploadFile(){
        GoogleDriveFileUploadHandler.uploadFile(attachmentName, attachmentBody, accessToken);
    }
   
}