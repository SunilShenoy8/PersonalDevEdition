({
	handleComponentEvent : function(component, event, helper) {
        console.log("IN OUTER COMPONENT  : Message Received :",event.getParam("msg"));
         component.set("v.Outer","OUTER : Message from Inner Component : "+event.getParam("msg"));
	},
})