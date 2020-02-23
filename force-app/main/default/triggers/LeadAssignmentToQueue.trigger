trigger LeadAssignmentToQueue on Lead (before insert,before update) {
    If(Trigger.isBefore)
    {
        QueuesObject que=[select queueid from QueuesObject where queue.name='TestQueForLead' LIMIT 1];
 
        for(lead l:Trigger.New)
        {
            if(l.Company=='tesco')
            {
                l.OwnerId=que.QueueId;
            } 
        }
        
    }

}