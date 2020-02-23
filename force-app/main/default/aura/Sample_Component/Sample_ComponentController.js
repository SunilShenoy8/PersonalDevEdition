({
	disp : function(component, event, helper) {
        var msg = component.get("v.info");
		var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!" +msg,
            "type" : "success",
            "message": "Successfuly Updated"
        });
        toastEvent.fire();
        window.location.reload();

	}
})