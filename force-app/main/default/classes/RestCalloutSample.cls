public with sharing class RestCalloutSample {
	public Http http;
	public HttpRequest request;
	public HttpResponse response;
	public RestCalloutSample() {
		http = new Http();
		request = new HttpRequest();
	}

	public HttpResponse receiveDataFromServer(){
		//GET Method
		
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
		request.setMethod('GET');

		response = http.send(request);
		System.debug('Status :'+response.getStatus());
		System.debug('Status code:'+response.getStatusCode());
		if(response.getStatusCode() == 200){
			System.debug('data received : '+response.getBody());
			Map<String,Object> mapData = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
			List<Object> animals = (List<Object>)mapData.get('animals');
			for(Object animal : animals){
				System.debug(animal);
			}
		}
		return response;

	}

	public HttpResponse sendDataToServer(){
		//POST Method
		String jsonAnimalStr='{"name":["a","b","c","d"]}';
		//String jsonAnimalStr='{"name":"dog"}';
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
		request.setMethod('POST');
		request.setHeader('Content-Type', 'application/json;charset=UTF-8');
		request.setBody(jsonAnimalStr);

		response = http.send(request);

		System.debug(response.getStatusCode());
		System.debug('Status :'+response.getStatus());
		if(response.getStatusCode() == 201){
			System.debug('data received : '+response.getBody());
		}

		return response;

	}
}