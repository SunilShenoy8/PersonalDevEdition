global class IteratorContactTestBatchApex implements Iterator<Contact> 
{
    global List<Contact> accList{get;set;} 
    global Integer count{get;set;}
    global IteratorContactTestBatchApex()
    {
        count=0;
        accList=[select id,LastName,Phone from Contact Limit 10];
    }
    
    global boolean hasNext()
    {
        if(count>=accList.size())
            return false;
        else
            return true;
    }
    
    global Contact next()
    {
        if(count>=accList.size())
            return null;
        else{
            count++;
            return accList[count-1];
        }
            
    }

}