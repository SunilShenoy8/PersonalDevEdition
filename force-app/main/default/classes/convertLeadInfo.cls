public class convertLeadInfo {
    public static void convert()
    {
        Lead myLead = new Lead(LastName = 'hari', Company='tesco');
		insert myLead;    
		Database.LeadConvert lc = new database.LeadConvert();
		lc.setLeadId(myLead.id);
		lc.ConvertedStatus = 'Closed - Converted';
		Database.LeadConvertResult lcr = Database.convertLead(lc);                
		System.assert(lcr.isSuccess());
    }

}