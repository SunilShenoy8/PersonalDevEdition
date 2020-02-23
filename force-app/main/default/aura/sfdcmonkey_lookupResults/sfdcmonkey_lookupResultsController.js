({
	selectRecord : function(component, event, helper) {
		var selectedRecord = component.get("v.oRecord");
        
        // fire an event to send the selected object to lookup component
        var compEvent = component.getEvent("oSelectedRecordEvent");
        compEvent.setParams({'recordByEvent' : selectedRecord });
        compEvent.fire();
	}
})