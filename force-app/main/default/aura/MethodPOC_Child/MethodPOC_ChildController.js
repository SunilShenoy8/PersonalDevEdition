({
	onClickControllerChild : function(component, event, helper) {
        component.set("v.Parent_Name","CHILD COMPONENT");
        console.log("Its child: HIIIIIIIIIII....FROM  "+component.get("v.Parent_Name"));
        helper.fireApplicationEvent(component,event);
	},
    logParam : function(component, event,helper) {
        console.log("entered logParam");
        var params = event.getParam('arguments');
        if (params) {
            var message = params.message;
            console.log("message from parent : " + message);
            component.set("v.Parent_Name",message);
            console.log('hai',component.get("v.Parent_Name"));
            helper.fireApplicationEvent(component,event);
        }
    },
    
    
})