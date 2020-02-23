public class DropEmailHandler{
	public String subject { get; set; }
	public String body { get; set; }
	public String toID { get; set; }
    public String selectedTemplateId {get; set; }
    public EmailTemplate template{get;set;}
    
    public void initLoad(){
        toID = [SELECT email FROM Contact WHERE id = :ApexPages.currentPage().getParameters().get('id')].email;
        System.debug('email Id'+toID);
    }
    
    public List<SelectOption> getTemplateOptions() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('None','--None--'));
        for (EmailTemplate t : [select Id,Name from EmailTemplate]) {
            options.add(new SelectOption(t.Id,t.Name));
        }
        return options;
    }
    
    public void fillProjectTasks()
    {
        template=new EmailTemplate();
        String proIdVal = selectedTemplateId; 
        System.debug('============proIdVal======'+proIdVal);
        template=[select Id,Name,Body,Subject from EmailTemplate where id=:proIdVal];
        System.debug(template);
    }

	
	public PageReference send() {
		Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage(); 

		String[] toAddresses = toID.split(':', 0);

		// Sets the paramaters of the email
		email.setSubject( subject );
		email.setToAddresses( toAddresses );
		email.setPlainTextBody( body );
    
		// Sends the email
		Messaging.SendEmailResult [] r = 
			Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});   
		
		return null;
	}
}