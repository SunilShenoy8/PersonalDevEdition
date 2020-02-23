public with sharing class MultiSelectOpportunityPage {
	public String selectedOppStage{get;set;}
	public String selectedOppLeadSource{get;set;}

	public List<Opportunity> AllOpps{get;set;}
	public List<Opportunity> TempList{get;set;}

	public List<SelectOption> getOppStages(){
		List<SelectOption> options =  new List<SelectOption>();    
	    options.add(new selectOption('None','--- None ---'));    
	    Schema.DescribeFieldResult fieldResult = Opportunity.stagename.getDescribe();    
	    List<Schema.picklistEntry> vls = fieldResult.getPicklistValues();    
	    for(Schema.picklistEntry v:vls)    
	    {    
	        options.add(new selectOption(v.getLabel(),v.getValue()));                    
	    }
	    return options;
	}

	public List<SelectOption> getOppLeadSource(){
		List<SelectOption> options =  new List<SelectOption>();    
	    options.add(new selectOption('None','--- None ---'));    
	    Schema.DescribeFieldResult fieldResult = Opportunity.LeadSource.getDescribe();    
	    List<Schema.picklistEntry> vls = fieldResult.getPicklistValues();    
	    for(Schema.picklistEntry v:vls)    
	    {    
	        options.add(new selectOption(v.getLabel(),v.getValue()));                    
	    }
	    return options;
	}

	public void changeStage(){
		System.debug('selected Item is : '+selectedOppStage);
		AllOpps = [SELECT id,Name,Account.Name,Amount,CloseDate,StageName,LeadSource FROM Opportunity WHERE StageName =: selectedOppStage];
		TempList = AllOpps;
	}

	public void changeLeadSource(){
		System.debug('** selected Lead source is : '+selectedOppLeadSource);
		System.debug('All ops--'+TempList);
		AllOpps = new List<Opportunity>();
		for(Opportunity op : TempList){
			if(op.LeadSource == selectedOppLeadSource){
				AllOpps.add(op);
			}
		}
		System.debug('Final : '+AllOpps);
	}
}