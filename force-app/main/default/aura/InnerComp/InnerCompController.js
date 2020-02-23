({
	fireComponentEvent : function(component, event, helper) {
		console.log("In fireComponentEvent");
        // Get the component event by using the
        // name value from aura:registerEvent
        
        var cmpEvent = component.getEvent("componentEvent");
        cmpEvent.setParams({
            "msg" : "Hi, All" });
        cmpEvent.fire();
	}
})