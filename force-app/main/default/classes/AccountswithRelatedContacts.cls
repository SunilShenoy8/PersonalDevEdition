public class AccountswithRelatedContacts {
    public list<Account>acc{get;set;}
    public String Accountname{get;set;}
    public String Response {get;set;}
    Public JSONwrapper wrapper{get;set;}
    
    public AccountswithRelatedContacts(){
        getresposnsefromCallout();
    }
    
    public void getresposnsefromCallout(){
        //String search=''+Accountname+'';
        // system.debug('searchstring'+search);
        String Endpoint='https://'+URL.getSalesforceBaseUrl().getHost()+'/services/data/v39.0/query/?q=SELECT +Id,Name ,(Select +id,name +from+contacts)+FROM + Account';
        System.debug('Endpoint'+Endpoint);
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        string autho = 'Bearer '+userInfo.getSessionId();
        req.setHeader('Authorization', autho);
        req.setEndpoint(Endpoint);
        Http http = new Http();
        HTTPresponse res= http.send(req);
        response = res.getBody();
        system.debug('response'+response);
        wrapper= (JSONwrapper) System.JSON.deserialize(response, JSONwrapper.class);
        system.debug('wrapper'+wrapper);
        //wrapper = (JSONwrapper) JSON.deserializeStrict(response, JSONwrapper.class);
    }
    
}