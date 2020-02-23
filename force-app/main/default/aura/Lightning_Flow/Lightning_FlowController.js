({
	init : function(component, event, helper) {
		var flow = component.find("flowData");
    	flow.startFlow("contactPhoneUpdate");
	},
    handleStatusChange : function(component, event, helper) {
        if(event.getParam("status") === "FINISHED") {
            var output = event.getParam("outputVariables");
            console.log("output : ",output);
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Success!",
                "message": "The Flow Completed successfully."
            });
            toastEvent.fire();
        }
    }
})