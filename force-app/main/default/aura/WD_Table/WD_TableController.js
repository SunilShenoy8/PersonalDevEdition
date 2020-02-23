({
	doInit : function(component, event, helper) {
		console.log('**entered controller for init**');
		helper.initHelper(component, event);
	},
	/*onChangeFunction : function(component,event,helper){
		console.log('**entered controller for onchange**');
		helper.onChangeHelper(component, event);
	},*/
	addRow: function(component,event,helper){
		helper.addRowHelper(component,event);
	},
	removeRow: function(component,event,helper){
		helper.removeRowHelper(component,event);
	},
	SaveData : function(component,event,helper){
		helper.SaveDataHelper(component,event);
	},
    onChangePickList : function(component,event,helper){
        console.log('Onchange picklist');
        console.log(component.find("dynamicResult"));
    },
    
    // function for clear the Record Selaction 
    clear :function(component,event,heplper){
        
        var pillTarget = component.find("lookup-pill");
        var lookUpTarget = component.find("lookupField"); 
        
        $A.util.addClass(pillTarget, 'slds-hide');
        $A.util.removeClass(pillTarget, 'slds-show');
        
        $A.util.addClass(lookUpTarget, 'slds-show');
        $A.util.removeClass(lookUpTarget, 'slds-hide');
        
        component.set("v.SearchKeyWord",null);
        component.set("v.listOfSearchRecords", null );
    },
    toggleSelectAll : function(component,event,helper){
        console.log("In Toggle select all");
        helper.toggleSelectAll(component,event);
    }

})