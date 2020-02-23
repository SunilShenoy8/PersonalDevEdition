({
	fireApplicationEvent : function(component,event) {
        // Get the application event by using the
        // e.<namespace>.<event> syntax
        var appEvent = $A.get("e.c:DisplayMessagePopupEvent");
        appEvent.setParams({
            "titleMsg" : "HI...",
            "bodyMsg"  : component.get("v.Parent_Name"),
            "open" : true
        });
        appEvent.fire();
    }
})