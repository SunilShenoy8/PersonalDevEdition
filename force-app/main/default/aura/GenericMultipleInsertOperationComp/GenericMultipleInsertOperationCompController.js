({
	doInit : function(component, event, helper) {
		console.log('**entered controller for init**');
		helper.fetchAllObjectsApiNames(component, event);
	},
	onChangeFunction : function(component,event,helper){
		console.log('**entered controller for onchange**');
		helper.onChangeHelper(component, event);
	},
	addRow: function(component,event,helper){
		helper.addRowHelper(component,event);
	},
	removeRow: function(component,event,helper){
		helper.removeRowHelper(component,event);
	},
	SaveData : function(component,event,helper){
		helper.SaveDataHelper(component,event);
	},
	closePopUp : function(component,event,helper){
        component.set("v.isObjectSelected",false);
    },
    onChangePickList : function(component,event,helper){
        console.log('Onchange picklist');
        console.log(component.find("dynamicResult"));
    },

})