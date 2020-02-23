public class JobAppResumeReviewed {
    List<Job_Application__c> jobList;
    public List<Job_Application__c> getJob_Applications()
    {
        jobList=[select Applicant__c,Position__c,Status__c from Job_Application__c where status__c='Review Resume'];
    	return jobList;
    }

}