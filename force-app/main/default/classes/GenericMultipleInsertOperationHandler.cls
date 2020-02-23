public class GenericMultipleInsertOperationHandler {
	public GenericMultipleInsertOperationHandler() {}

	//fetch all objects from schema
	@AuraEnabled
	public static List<SomeWrapper> getAllObjectApiNames(){
		List<SomeWrapper> objectApiNames = new List<SomeWrapper>();
		for ( Schema.SObjectType o : Schema.getGlobalDescribe().values() )
		{
			SomeWrapper sw = new SomeWrapper();
		    Schema.DescribeSObjectResult objResult = o.getDescribe();
		    sw.fieldApiName = String.valueOf(objResult.getName());
		    sw.fieldLabel = String.valueOf(objResult.getLabel());
		    objectApiNames.add(sw);
		}

		return objectApiNames; 
	}

	public class SomeWrapper{
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

	@AuraEnabled
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

	}
	@AuraEnabled
	public static String saveRecordDetails(String fieldValList, String ObjNameStr){
        Integer successResult = 0;
        String resultMsg = '';
		System.debug('List : '+fieldValList);
		System.debug('ObjName : '+ObjNameStr);
        
        List<Object> records = (List<Object>)Json.deserializeUntyped(fieldValList);
        Map<String,String> Details = new Map<String,String>();
        
        if(records.size() > 0){
            sObjectType s = Schema.getGlobalDescribe().get(ObjNameStr);
            
            //Identifying field type
            Map<String,Schema.SObjectField> mfields = s.getDescribe().fields.getMap();
            for(String key : mfields.keySet()){
				Schema.SObjectField field = mfields.get(key);
                Schema.DescribeFieldResult F = field.getDescribe();
                if(String.valueof(F.getType()) == 'DATE'){
                    Details.put(key,String.valueof(F.getType()));
                }
                 if(String.valueof(F.getType()) == 'DOUBLE' ){
                    Details.put(key,String.valueof(F.getType()));
                }
            }
            
            list<sObject> objects = new list<sObject>();
            for(object o : records) {
                //instantiate a new sObject based on the type specified in the objectMap
                sObject newRecord = s.newSObject();
                
                //Now cast the field mapping definition that the user has passed in to create the record
                map<string,object> recordDefinition = (map<string,Object>)o;
                for (string field : recordDefinition.keySet()) {
                    if(Details.containsKey(field)){
                        if(Details.get(field) == 'DATE'){
                            String dateVal = String.valueOf(recordDefinition.get(field));
                            System.debug('Date received : '+dateVal);
                            Date selectedDate = Date.valueOf(dateVal);
                            newRecord.put(
                                field,
                                selectedDate
                            );
                        }
                        else if(Details.get(field) == 'DOUBLE'){
                            Double selectedNumber = Double.valueOf(recordDefinition.get(field));
                            newRecord.put(
                                field,
                                selectedNumber
                            );
                        }
                    }
                    else{
                        newRecord.put(
                            field,
                            recordDefinition.get(field)
                        );
                    }
                    
                }
                
                system.debug('UDBG::::insertRecords looped through record and created newRecord: ' + newRecord);
                objects.add(newRecord);
            }
            if(!objects.isEmpty()){
                //insert objects;
                Database.SaveResult[] srList = Database.insert(objects, true);
                for (Database.SaveResult sr : srList) {
                    if (sr.isSuccess()) {
                        System.debug('Successfully update child Opportunities. Opportunity ID: ' + sr.getId());
                        successResult++;
                    }
                    else {
                        // Operation failed, so get all errors                
                        for(Database.Error err : sr.getErrors()) {
                            System.debug('The following error has occurred.');                    
                            System.debug(err.getStatusCode() + ': ' + err.getMessage());
                            System.debug('Opportunity fields that affected this error: ' + err.getFields());
                            resultMsg = 'Field :'+err.getFields()+' Error : '+err.getMessage()+' and ';
                        }
                    }

                }
            }
            
            if(successResult == objects.size()){
                resultMsg = 'sucess';
            }
            String responseMessage = objects.size() + ' records inserted';
            System.debug('responseMessage : '+responseMessage);
        }

		return resultMsg;
	}
    
    
}