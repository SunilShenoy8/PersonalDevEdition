({
	handleComponentEvent : function(component, event, helper) {
        console.log("IN INTER COMPONENT  : Message Received :",event.getParam("msg"));
        component.set("v.Inter","INTER COMPONENT  : Message from Inner Component : "+event.getParam("msg"));
	},
})