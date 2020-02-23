({
    doInit  : function(component, event, helper) {
        var x = [
            {name:'Jan-19',mwh:20000,mw:null},
            {name:'Feb-19',mwh:21000,mw:null},
            {name:'Mar-19',mwh:22000,mw:null},
            {name:'Apr-19',mwh:23000,mw:null}
        ];
        component.set("v.records",x);
        component.set("v.tableHeading",'Months');
    },
	toggleTable : function(component, event, helper) {
		 var acc = component.find('tableContainer');
     	 $A.util.toggleClass(acc, 'slds-show'); 
	}
})