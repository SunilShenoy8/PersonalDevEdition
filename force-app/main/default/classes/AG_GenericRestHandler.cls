public class AG_GenericRestHandler {
    
    public static OAuth2 getOAuth2Details(String endPoint, String consumerKey, String consumerSecret, string username, String password){ // password + security token is must
        String reqbody = 'grant_type=password&client_id='+consumerKey+
            			 '&client_secret='+consumerSecret+
                         '&username='+EncodingUtil.urlEncode(username, 'UTF-8')+
                         '&password='+EncodingUtil.urlEncode(password, 'UTF-8');
		
        Http http = new Http();
        HttpRequest request  = new HttpRequest();
        request.setMethod('POST');
        request.setBody(reqbody);
        request.setEndpoint(endPoint+'/services/oauth2/token');
        HttpResponse response = http.send(request);
        
        OAuth2 objAuthenticationInfo = (OAuth2)JSON.deserialize(response.getbody(), OAuth2.class);
        return objAuthenticationInfo;
    }
    
    // Inner Wrapper class for OAuth2 JSON Object
    public class OAuth2{
        public String id{get;set;}
        public String issued_at{get;set;}
        public String instance_url{get;set;}
        public String signature{get;set;}
        public String access_token{get;set;}    
    }
    
}