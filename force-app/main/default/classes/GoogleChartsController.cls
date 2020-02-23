global with sharing class GoogleChartsController {
	@RemoteAction
	global static Opportunity[] loadOpps()
	{
		return [select Id,Name,ExpectedRevenue,Amount from Opportunity order by CreatedDate DESC limit 10];
	}
}