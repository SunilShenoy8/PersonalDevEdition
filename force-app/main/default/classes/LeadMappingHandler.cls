public class LeadMappingHandler {

    public static final String STATUS='Closed - Converted';
    public static void mapLeadAndConvert(List<Lead> leadList)
    {
        List<Lead> leadToConvert=new List<Lead>();
        List<Database.LeadConvert> checkList=new List<Database.LeadConvert>();
        List<Database.LeadConvert> convertedList=new List<Database.LeadConvert>();
        for(Lead l:leadList)
        {
            if(l.Status=='Working - Contacted')
            {
                leadToConvert.add(l);
            }
        }
        if(leadToConvert.size()>0)
        {
            for(Lead l:leadToConvert)
            {
                Database.LeadConvert lc = new database.LeadConvert();
                lc.setLeadId(l.id);
                lc.ConvertedStatus = STATUS;
                checkList.add(lc);
                
            }
        }

        if(checkList.size()>0)
        {
            for(Database.LeadConvert lc:checkList)
            {
                Database.LeadConvertResult lcr=Database.convertLead(lc);
                System.assert(lcr.isSuccess());
            }
        }

    }

}