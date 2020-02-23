public class DeskIntegration {
    public string consumerKey = '4mYlBEat3y9HJlGFGCPS';
    public string consumerToken = 'vU9YHJifkcPT64dFEd4B';
    public string consumerSignatureMethod = 'PLAINTEXT';
	public String timestamp = '1529304487';
    public String nonce = 'TBienx';
    public String version = '1.0';
    public String authSignature = 'A6VTgBRN8K9Bkb1Yz2nCZB7rgyWwrT5qQGITmZDR%26RFNob8q6W0KLCuzawtSyQiAQZJ0UAQJHm6vFMVSw';
    public String perPage = '50';
    
    public void fetchCasesFromDesk(){
        String endPoint = 'https://himalayawellnesscom.desk.com/api/v2/cases?oauth_consumer_key='+consumerKey+'&oauth_token='+consumerToken+'&oauth_signature_method='+consumerSignatureMethod+'&oauth_timestamp='+timestamp+'&oauth_nonce='+nonce+'&oauth_version='+version+'&oauth_signature='+authSignature+'&per_page='+perPage;
        String oauthStr = 'oauth_consumer_key="4mYlBEat3y9HJlGFGCPS",oauth_token="vU9YHJifkcPT64dFEd4B",oauth_signature_method="PLAINTEXT",oauth_timestamp="1529909890",oauth_nonce="JU8l1J",oauth_version="1.0",oauth_signature="A6VTgBRN8K9Bkb1Yz2nCZB7rgyWwrT5qQGITmZDR%26RFNob8q6W0KLCuzawtSyQiAQZJ0UAQJHm6vFMVSw"';
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endPoint);
        req.setMethod('GET');
        req.setHeader('Authorization', 'OAuth '+oauthStr);
        
        HttpResponse res = new Http().send(req);
        
        if(res.getStatusCode() == 200){
            System.debug('getDataFromHeruku >> Response : '+res.getBody());
            String response = res.getBody();
            response = response.replace('"class":', '"cls":');
            response = response.replace('"_links":', '"x_links":');
            response = response.replace('"_embedded":', '"x_embedded":');
            
            DeskCaseJson cs = (DeskCaseJson) JSON.deserialize(response, DeskCaseJson.class);
            System.debug('case : Entries : '+cs);
            
            for ( DeskCaseJson.cls_entries entry : cs.x_embedded.entries) {
                System.debug('Data :' + entry);
            }
        }else{
            System.debug('getDataFromHeruku >> Response : '+res.getBody());
        }
    }
}