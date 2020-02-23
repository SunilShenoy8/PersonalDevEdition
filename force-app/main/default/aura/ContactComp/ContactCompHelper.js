({
   loadContacts : function(component) {
       console.log("loadContacts");
        var action = component.get("c.loadContacts");
        action.setParams({ accountId : component.get("v.recordId") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               var contactList = response.getReturnValue();
                console.log("response : ",response.getReturnValue());
                if(contactList.length > 0 && contactList != null ){
                    component.set("v.contactList",contactList);
                    component.set("v.showComponent",true);
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