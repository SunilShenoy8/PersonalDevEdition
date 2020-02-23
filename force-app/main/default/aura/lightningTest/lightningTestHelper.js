({
	getContactInfo : function(component,event) {
		var action = component.get('c.getcontactList');
        console.log('action data: '+action);
        action.setParams({ recordId : component.get("v.recordId") });
		action.setCallback(this, function(response) {
        	var state = response.getState();
            if (state === "SUCCESS") 
            {
                var contactItems = response.getReturnValue();
                for(var i=0;i<contactItems.length;i++){
                	console.log(contactItems[i].Name +' '+contactItems[i].Email);
                }
                console.log('data received: '+contactItems);
                if((contactItems != null && contactItems.length>0)){
                    component.set("v.contactList", contactItems);
                }
                else{
                	console.log("null value received || length is 0");
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
	},
})