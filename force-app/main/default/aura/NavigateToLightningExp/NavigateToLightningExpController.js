({
	doInit : function(component, event, helper) {
        console.log("Hai");
        $A.get("e.force:navigateToURL").setParams({ 
            "url": "/lightning/o/Lead/list" 
        }).fire();
	}
})