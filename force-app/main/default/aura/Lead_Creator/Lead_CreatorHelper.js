({
	getobjectNameByRecordId : function(component,event) {
        var recId = component.get("v.recordId");
        console.log('Entered Helper : getobjectNameByRecordId : record id :'+recId);
        
        var action = component.get('c.getObjectNameById');
        console.log('getobjectNameByRecordId : action data: '+action);
        action.setParams({ recordId : component.get("v.recordId") });
		action.setCallback(this, function(response) {
        	var state = response.getState();
            if (state === "SUCCESS") 
            {
                var sObjDetail = response.getReturnValue();
                console.log('sObjDetail : ',sObjDetail);
                if(sObjDetail != null){
                    component.set("v.sObjectDetail",sObjDetail);
                }
            }
            else if (state === "ERROR") {
            	var errors = response.getError();
                if (errors) {
                	if (errors[0] && errors[0].message) {
                    	console.log("Error message: " +errors[0].message);
                    }
                }
                else {
                	console.log("Unknown error");
                }
            }
        });
        
        $A.enqueueAction(action);
	}
})