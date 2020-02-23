global class BatchApexTestIterarorClass{
    
    global BatchApexTestIterarorClass(){}
    global Iterator<Contact> start(Database.BatchableContext bc)
    {
        return new IteratorContactTestBatchApex();
    }
    
    global void execute(Database.BatchableContext bc,List<Contact> scope)
    {
        List<Contact> conList=new List<Contact>();
        Integer i=0;
        for(Contact c:scope)
        {
            c.LastName='Batch Apex '+ ++i;
            c.Phone='1234500000';
            conList.add(c);
        }
        update conList;
    }
    global void finish(Database.BatchableContext bc)
    {
        //System.debug('Account Details :'+);
    }

}