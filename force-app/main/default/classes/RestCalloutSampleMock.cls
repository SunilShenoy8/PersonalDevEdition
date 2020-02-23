@isTest
public class RestCalloutSampleMock implements HttpCalloutMock {

    protected Integer statuscode;
    protected String status;
    protected String body;
    protected map<String,String> responseHeaders = new map<String,String>{'Content-Type'=>'application/json;charset=UTF-8'};

    public RestCalloutSampleMock() {
        this.statuscode = 200;
        this.status = 'Created';
        this.body = '{"animals":["majestic badger","fluffy bunny","scary bear","chicken"}';
        this.responseHeaders = responseHeaders;
    }

    public HTTPResponse respond(HTTPRequest req) {

        HttpResponse res = new HttpResponse();
        for (String key : this.responseHeaders.keySet()) {
            res.setHeader(key, this.responseHeaders.get(key));
        }
        res.setBody(this.body);
        res.setStatusCode(this.statuscode);
        res.setStatus(this.status);
        return res;
    }

}