({
	saveData : function(component,event) {
		console.log('**entered helper**');
		var action = component.get('c.updateValues');
        action.setParams({ "idVal" : component.get("v.recordId"),
                          "nameVal" : component.get("v.nameStr"),
                          "Dept" : component.get("v.Department")
                         });

		action.setCallback(this, function(response) {
        	var state = response.getState();
            if (state === "SUCCESS") 
            {
                console.log("Is updated successfully : ",response.getReturnValue());
                if(response.getReturnValue()){
                    $A.get('e.force:refreshView').fire();
                    $A.get("e.force:closeQuickAction").fire();
                }	
            }
            else if (state === "INCOMPLETE") {
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