public class ProjectTriggerHandler {
    public static void roundRobinSectionNum(List<Project__c> proList)
    {
        Integer count=[select count() from Project__c];
        Integer i=1;
        for(Project__c pc:proList)
        {
            pc.Project_no__c=count+i;
            Integer val=Math.mod(count+i, 4);
            if(val!=0)
            {
                pc.Project_Section__c=val;
            }
            else
            {
                pc.Project_Section__c=0;
            }
            i++;
        }
    }

}