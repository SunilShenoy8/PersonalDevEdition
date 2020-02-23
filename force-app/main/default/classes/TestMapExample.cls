public class TestMapExample {
	Map<Integer,String> countryCodeDetails=new Map<Integer,String>();
	public TestMapExample() {
		countryCodeDetails.put(1,'INDIA');
		countryCodeDetails.put(2,'NEPAL');
		countryCodeDetails.put(3,'USA');
		countryCodeDetails.put(4,'SOUTH AFRICA');
		System.debug('Get:'+countryCodeDetails.get(5));
		System.debug('Keyset:'+countryCodeDetails.keySet());
		System.debug('Values:'+countryCodeDetails.values());
		System.debug('Contains key:'+countryCodeDetails.containsKey(5));
	}

}