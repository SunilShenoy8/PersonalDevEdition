({
    doInit : function(component, event, helper) {
        console.log('do Init');
        $A.createComponent(
            "c:MethodPOC_Child",
            {
                "aura:id": "child",
            },
            (child, status, errorMessage) => {
                if (status === 'SUCCESS') {
                	console.log('Child created :  SUCCESS'); 
                    component.set('v.child', child);
                	console.log('get child : ',component.get("v.child"));
               		$A.log("SUCCESS log using $A.log");
                }
                else {
                    console.log('ERROR: child - '+status);
                }
            }
        );
    },
    onClickControllerParent : function(component, event, helper) {
        console.log("Entered to onclick parent");
        var childCmp = component.get("v.child");
        const PARENT_NAME = 'PARENT COMPONENT';
        // Invoke aura:method
        childCmp.logParam(PARENT_NAME);
    }
})