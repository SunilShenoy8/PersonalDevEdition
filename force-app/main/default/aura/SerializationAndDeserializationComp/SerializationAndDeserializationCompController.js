({
	doInit : function(component, event, helper) {
        console.log("record id : ",component.get("v.recordId"));
         var cont = {};
        cont.accountId = component.get("v.recordId");
        cont.lastName = "";
        cont.email = "";
        cont.phone = "";
        component.set("v.ContactObj",cont);
	},
    saveContact : function(component, event, helper) {
       
        
		console.log("Contact Object : ",component.get("v.ContactObj"));
        var action = component.get('c.saveContactRec');
        action.setParams({
            'jsonContactStr' : JSON.stringify(component.get("v.ContactObj"))
        });
        
        action.setCallback(this, function(response){
            console.log('Hi');
            var status = response.getState();
            if(status==='SUCCESS')
            {
                var result=response.getReturnValue();
                console.log('Result-- ', result);
                if(result){
                    alert("Saved successfully");
                }else{
                    alert("Not saved");
                }
            }
            else
            {
                alert('Error');
            }
        });
        $A.enqueueAction(action);
        
	}
})