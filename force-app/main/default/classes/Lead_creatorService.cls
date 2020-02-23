public class Lead_creatorService {
    @auraEnabled
    public static ObjectWrapper getObjectNameById(String recordId){
        Id record_id;
        String sObjName;
        ObjectWrapper obj = new ObjectWrapper();
        if(recordId != '' || recordId != null){
            record_id = Id.valueOf(recordId);
            obj.objApiName = record_id.getSObjectType().getDescribe().getName();
            obj.objLabel = record_id.getSObjectType().getDescribe().getLabel();
        }
        if(obj != null){
            return obj;
        }
        return null;
    }
    
    public class ObjectWrapper{
		@AuraEnabled
		public String objLabel;

		@AuraEnabled
		public String objApiName;
	}

}