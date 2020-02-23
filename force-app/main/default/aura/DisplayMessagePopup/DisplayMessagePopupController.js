({
	close : function(component, event, helper) {
		component.set("v.letsOpen",false);
	},
    handleApplicationEvent : function(component, event, helper) {
        console.log("In handleApplicationEvent");
		component.set("v.titleText",event.getParam("titleMsg"));
		component.set("v.bodyText",event.getParam("bodyMsg"));
        component.set("v.letsOpen",event.getParam("open"));
	},
})