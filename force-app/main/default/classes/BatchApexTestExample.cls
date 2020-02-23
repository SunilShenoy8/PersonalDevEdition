global class BatchApexTestExample implements Database.Batchable<sObject> {
	
	String query;
	String entity;
	String value;
	String field;
	
	global BatchApexTestExample(String q, String e, String f,String v) {
		query=q;
		entity=e;
		field=f;
		value=v;
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<sObject> scope) {
		
		for(sObject c:scope)
		{
			c.put(field,value);
		}
		update scope;
	}
	
	global void finish(Database.BatchableContext BC) {
	}
	
}