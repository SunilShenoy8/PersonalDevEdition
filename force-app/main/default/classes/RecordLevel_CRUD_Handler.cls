public class RecordLevel_CRUD_Handler {
	
    
    @AuraEnabled
    public static ReturnMapWrapper getFieldSet(){
        map<String,List<FieldMetadata>> returnMap = new map<String,List<FieldMetadata>>();
        List<FieldMetadata> fsList = new List<FieldMetadata>();
        List<String> fieldApiList = new List<String>();
        List<String> requiredFieldApis = new List<String>();
        String selectedObjectApiName = '';
        // step 1 :  get Object Name and get Fields selected from the object
        WD_Table_Details__c TableDetails = [SELECT Field_Api_String__c FROM WD_Table_Details__c WHERE Name =: 'MainRecord' LIMIT 1];
        System.debug('WD_Table_Details__c : '+TableDetails);
        if(TableDetails.Field_Api_String__c != null || TableDetails.Field_Api_String__c != ''){
            /*selectedObjectApiName = String.valueOf(TableDetails.get('ObjectApi__c'));
            String csvFieldStr = String.valueOf(TableDetails.get('Field_Api_String__c'));
            fieldApiList = csvFieldStr.split(',');
            System.debug('Object details : API Name :'+selectedObjectApiName+' Field List : '+fieldApiList);*/
            String jsonStr = String.valueOf(TableDetails.get('Field_Api_String__c'));
            JsonWrapper  ObjDetails = (JsonWrapper)JSON.deserializeStrict(jsonStr,JsonWrapper.class);
            System.debug('ObjDetails : '+ObjDetails);
            System.debug('Object Metadata : '+ObjDetails.ObjectDetails.ApiName);
            System.debug('Field metadata : '+ObjDetails.FieldDetails);
            selectedObjectApiName = ObjDetails.ObjectDetails.ApiName;
            fieldApiList = ObjDetails.FieldDetails;
            requiredFieldApis = ObjDetails.RequiredFields;
            
        }
        // step 2 : get schema details of selected fileds
        SObjectType objType = Schema.getGlobalDescribe().get(selectedObjectApiName);
		Map<String,Schema.SObjectField> allFields = objType.getDescribe().fields.getMap();
        System.debug('all fields : '+allFields);
        Map<String,Schema.SObjectField> mfields = new Map<String,Schema.SObjectField>();
        Set<String> keyFieldNames = allFields.keySet();
        System.debug('allFields.keySet() : '+allFields.keySet());
        for(String f1 : allFields.keySet()){
            for(String f2 : fieldApiList){
                System.debug('a : '+f1.trim()+' b : '+f2.toLowerCase().trim());
                if(f1.trim() == f2.toLowerCase().trim()){
                    System.debug('matched : '+f1);
                    mfields.put(f1,allFields.get(f1));
                    break;
                }
            }
        }
        System.debug('mfields : '+mfields);
        if(mfields.size() > 0){
            for(String key : mfields.keySet()){
                Schema.SObjectField field = mfields.get(key);
                Schema.DescribeFieldResult F = field.getDescribe();
                if(F.isUpdateable()==True && F.isDefaultedOnCreate() == false)
                {
                    System.debug('Field Description : '+F);
                    FieldMetadata fs = new FieldMetadata();
                    fs.fieldApiName = key;
                    fs.fieldType = String.valueOf(F.getType());
                    fs.fieldLabel = String.valueOf(F.getLabel());
                    
                    //Check if Required Field
                    if(F.isNillable() == false){
                        fs.isRequiredField = true;
                    }
                    
                    System.debug('Field Type '+fs.fieldType+' => Compared with => PICKLIST');
                    if(fs.fieldType == 'PICKLIST'){
                        list <Schema.PicklistEntry> values = F.getPickListValues();
                        System.debug('Field : '+fs.fieldApiName+' PickList values : '+values);
                        for (Schema.PicklistEntry a: values) {
                            System.debug('Values :'+a.getLabel());
                            fs.pickListVal.add(a.getLabel());
                        }
                        System.debug('List of picklist : '+fs.pickListVal);
                    }
                    
                    if(fs.fieldType == 'REFERENCE'){
                        // (Account) To Account
                        String temp = String.valueOf(F.getReferenceTo());
                        String sub = temp.substring(1, temp.length()-1);
                        fs.referenceTo = sub;
                        System.debug('Reference field : '+fs.fieldLabel+' Refered to : '+fs.referenceTo);
                    }
                    fsList.add(fs);
                    
                }
                
            }
        }
        // set required fields
        if(requiredFieldApis.size() > 0 && fsList.size() > 0){
            for(String f1 : requiredFieldApis){
                for(Integer i = 0 ; i < fsList.size() ; i++){
                    if(fsList[i].fieldApiName == f1.trim()){
                        System.debug('required field : '+f1);
                        fsList[i].isRequiredField = true;
                    }
                }
            }
        }
        
        System.debug('Field details : '+fsList);
        ReturnMapWrapper ow = new ReturnMapWrapper();
        if(selectedObjectApiName != '' ||  fsList.size() > 0){
            ow.objApiName = selectedObjectApiName;
            ow.objectFields = fsList;
        }
        
		System.debug('Return Map : '+ow);
        return ow;
        
    }
    
    public class ReturnMapWrapper{
		@AuraEnabled
		public String objApiName;
        
        @AuraEnabled
		public List<FieldMetadata> objectFields;
	}
    public class ObjectMetadata{
        @AuraEnabled
		public String ApiName;
        
        @AuraEnabled
		public String Label;
        
        @AuraEnabled
		public String Plural;
    }
    public class FieldMetadata{
		@AuraEnabled
		public String fieldLabel;

		@AuraEnabled
		public String fieldApiName;

		@AuraEnabled
		public String fieldType;

		@AuraEnabled
		public List<String> pickListVal = new List<String>();

		@AuraEnabled
		public String referenceTo;
        
        @AuraEnabled
		public Boolean isRequiredField;

	}
    public class JsonWrapper{
        @AuraEnabled 
        public ObjectMetadata ObjectDetails = new ObjectMetadata();
        
        @AuraEnabled
        public List<String> FieldDetails = new List<String>();
        
        @AuraEnabled
        public List<String> RequiredFields = new List<String>();
        
        @AuraEnabled
        public List<String> Validations = new List<String>();
    }
    
    /*@auraEnabled
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
    }*/
   /* @AuraEnabled
	public static List<SomeWrapper> getFetchAllFieldNames(String objName){
		List<SomeWrapper> retList = new List<SomeWrapper>();
		SObjectType objType = Schema.getGlobalDescribe().get(objName);
		Map<String,Schema.SObjectField> mfields = objType.getDescribe().fields.getMap();
		for(String key : mfields.keySet()){
			
			Schema.SObjectField field = mfields.get(key);
            Schema.DescribeFieldResult F = field.getDescribe();
            if(F.isUpdateable()==True && F.isDefaultedOnCreate() == false)
			{
				System.debug('Field Description : '+F);
				SomeWrapper sw = new SomeWrapper();
				sw.fieldApiName = key;
				sw.fieldType = String.valueOf(F.getType());
				sw.fieldLabel = String.valueOf(F.getLabel());
                
                //Check if Required Field
                if(F.isNillable() == false){
                    sw.isRequiredField = true;
                }
                
				System.debug('Field Type '+sw.fieldType+' => Compared with => PICKLIST');
				if(sw.fieldType == 'PICKLIST'){
					list <Schema.PicklistEntry> values = F.getPickListValues();
					System.debug('Field : '+sw.fieldApiName+' PickList values : '+values);
					for (Schema.PicklistEntry a: values) {
						System.debug('Values :'+a.getLabel());
					   sw.pickListVal.add(a.getLabel());
					}
					System.debug('List of picklist : '+sw.pickListVal);
				}

				if(sw.fieldType == 'REFERENCE'){
					// (Account) To Account
					String temp = String.valueOf(F.getReferenceTo());
					String sub = temp.substring(1, temp.length()-1);
					sw.referenceTo = sub;
					System.debug('Reference field : '+sw.fieldLabel+' Refered to : '+sw.referenceTo);
				}
				retList.add(sw);

			}
		}
		System.debug(retList);
		return retList;	

	}*/
    
    
    

	

}