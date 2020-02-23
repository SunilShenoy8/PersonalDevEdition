({
	doInit : function(component, event, helper) {
		component.set("v.flagToDisp",true);
	},
    close : function(component){
        component.destroy();
    },
    collectRating : function(component,event,helper){
        var selectedVal = event.currentTarget.getAttribute('data-item');
        component.set("v.selectedRating",parseInt(selectedVal));
        var cmpTarget = component.find(selectedVal);
        $A.util.addClass(cmpTarget, 'roundclick');
        helper.removeSelectedOptionCss(component,selectedVal);
        alert('selectedVal : '+component.get("v.selectedRating"));
    }
})