public class LeadAutomaticTriggerHandler {
	public static void handle(List<Lead> leadList)
	{
		//QueuesObject que=[select id,queueid from QueuesObject where queue.name='LeadAssignmentQueue' LIMIT 1];
		Group g=[Select Id from Group where type=:'Queue' and Name=:'LeadAssignmentQueue'];
		QueuesObject que=[select id,queueid from QueuesObject where queueid=:g.id LIMIT 1];
		List<GroupMember> userList=[Select UserOrGroupId From GroupMember where GroupId =:g.Id];
		List<Lead> leadsWithQueue=new List<Lead>();
		List<Lead> insertLeadList=new List<Lead>();
		System.debug(userList);
		DataStore__c data=[select value__c from DataStore__c where Name=:'info' Limit 1];
		Integer valNumber=Integer.valueOf(data.value__c)+1;
		for(Lead l:leadList)
		{
			l.OwnerId=que.queueid;
			leadsWithQueue.add(l);
		}
		for(Lead l:leadsWithQueue)
		{
            System.debug(l.OwnerId);
			if(l.OwnerId==que.queueid)
			{
				for(Integer i=0;i<userList.size();i++)
				{
                    System.debug('i : '+i);
                    Integer modVal=math.mod(valNumber,userList.size());
					if(modVal!=0)
					{
						System.debug(valNumber+' '+modVal);
						l.ownerId=userList[modVal].UserOrGroupId;
					}
                    else
                    {
                        System.debug('stored data:mod 0'+valNumber);
                        l.ownerId=userList[0].UserOrGroupId;
                    }
				}
			}
			valNumber++;
		}
		data.value__c=valNumber;
		update data;

	}
}