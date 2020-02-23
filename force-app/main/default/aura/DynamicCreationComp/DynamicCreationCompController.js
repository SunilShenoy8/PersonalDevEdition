({
	init: function(component, event, helper) {
        component.set("v.edits", []);
    },
    addField: function(component, event, helper) {
        var field = component.get("v.fieldName");
        if(field != null && field != ''){
            $A.createComponent(
                "lightning:input", {
                    value: "",
                    label: component.get("v.fieldName"),
                    type: "Text"
                },
                $A.getCallback(function(newCmp, status, error) {
                    var edits = component.get("v.edits");
                    edits.push(newCmp);
                    component.set("v.edits", edits);
                    component.set("v.fieldName","");
                })
            );
        }
    }
    
})