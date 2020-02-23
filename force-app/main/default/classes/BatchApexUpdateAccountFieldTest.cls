global class BatchApexUpdateAccountFieldTest implements Database.Batchable<sObject> 
{
	global final String Entity,Field,Query,Value;
    global BatchApexUpdateAccountFieldTest(String q,String e,String f,String v)
    {
        Query=q;
        Entity=e;
        Field=f;
        Value=v;
    }
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc,List<sObject> scope)
    {
        for(sObject so:scope)
        {
            so.put(Field,Value);
        }
        
        update scope;
    }
    
    global void finish(Database.BatchableContext bc)
    {
        //System.debug('Account Details :'+);
    }
    
}