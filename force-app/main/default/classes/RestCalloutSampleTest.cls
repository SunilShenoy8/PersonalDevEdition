@isTest
public with sharing class RestCalloutSampleTest {
	@isTest
	public static void testCallout(){
		
		Test.setMock(HttpCalloutMock.class, new RestCalloutSampleMock());

		HttpResponse res = new RestCalloutSample().receiveDataFromServer();

		System.assertEquals(200,res.getStatusCode());
		System.assertEquals('Created',res.getStatus());
		System.assertEquals(res.getHeader('Content-Type'),'application/json');
		System.assertEquals(res.getBody(),'{"animals":["majestic badger","fluffy bunny","scary bear","chicken"}');
		
		HttpResponse res1 = new RestCalloutSample().sendDataToServer();

		System.debug(res1.getBody());

		System.assertEquals(201,res1.getStatusCode());
		System.assertEquals('Created',res1.getStatus());
		System.assertEquals(res1.getHeader('Content-Type'),'application/json');
		String expectedval = '{"animals":["majestic badger","fluffy bunny","scary bear","chicken",["a","b","c","d"]]}';
		System.assertEquals(res1.getBody(),expectedval);	
	}
}