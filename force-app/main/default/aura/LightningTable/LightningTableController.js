({
    /*
     * This finction defined column header
     * and calls getAccounts helper method for column data
     * editable:'true' will make the column editable
     * */
	doInit : function(component, event, helper) {        
        component.set('v.columns', [
            
            {
                label: 'Account Name', 
                fieldName: 'linkName', 
                sortable: true, 
                type: 'url', 
            	typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}
            }, // Process of adding record URL
            {	
                label: 'Phone', 
             	fieldName: 'Phone', 
                type: 'phone',
                sortable: true
            },
            {
                label: 'Rating', 
                fieldName: 'Rating', 
                type: 'text'
            },
            {
                label: 'Active', 
             	fieldName: 'Active__c', 
             	type: 'text'
            },
            {
                type:  'button',
                initialWidth: 80,
                typeAttributes: 
                {
                    iconName: 'utility:edit',
                    label: '', 
                    name: 'editRecord', 
                    title: 'editTitle', 
                    disabled: false, 
                    value: 'test'
                }
            },
            {
                type:  'button',
                initialWidth: 80,
                typeAttributes: 
                {
                    iconName: 'utility:delete',
                    label: '', 
                    name: 'deleteRecord', 
                    title: 'deleteTitle', 
                    disabled: false, 
                    value: 'test'
                }
            },
            
        ]);
        helper.buildFieldNameList(component,event);
        helper.getAccounts(component, helper);
    },
    
    onNext : function(component, event, helper) {        
        var pageNumber = component.get("v.currentPageNumber");
        component.set("v.currentPageNumber", pageNumber+1);
        helper.buildData(component, helper);
    },
    
    onPrev : function(component, event, helper) {        
        var pageNumber = component.get("v.currentPageNumber");
        component.set("v.currentPageNumber", pageNumber-1);
        helper.buildData(component, helper);
    },
    
    processMe : function(component, event, helper) {
        component.set("v.currentPageNumber", parseInt(event.target.name));
        helper.buildData(component, helper);
    },
    
    onFirst : function(component, event, helper) {        
        component.set("v.currentPageNumber", 1);
        helper.buildData(component, helper);
    },
    
    onLast : function(component, event, helper) {        
        component.set("v.currentPageNumber", component.get("v.totalPages"));
        helper.buildData(component, helper);
    },
    updateColumnSorting: function (cmp, event, helper) {
        // We use the setTimeout method here to simulate the async
        // process of the sorting data, so that user will see the
        // spinner loading when the data is being sorted.
        setTimeout(function() {
            var fieldName = event.getParam('fieldName');
            var sortDirection = event.getParam('sortDirection');
            cmp.set("v.sortedBy", fieldName);
            cmp.set("v.sortedDirection", sortDirection);
            helper.sortData(cmp, fieldName, sortDirection);
        }, 0);
    }, 
    handleRowAction: function (cmp, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');
        switch (action.name) {
            case 'editRecord':
                console.log("Row selected : ",JSON.stringify(row));
                alert("Selected record Name : "+row.Name);
                break;
            case 'deleteRecord':
                console.log("You waana delete : ",JSON.stringify(row));
                alert("Selected record Name : "+row.Name);
                break;
            // You might have other buttons as well, handle them in the same way
            case 'action2':
                helper.handleAction2(cmp, row, action);
                break;
            // etc.
    	}
    },
    handleOnSelect : function (cmp, event, helper) {
        var selectedRows = event.getParam('selectedRows');
    	// Display that fieldName of the selected rows
    	for (var i = 0; i < selectedRows.length; i++){
        	//alert("You selected: " + selectedRows[i].Name);
    	}
        console.log('selectedRows :',selectedRows.length);

    },
    filter: function(component, event, helper) {
       /* console.log("colApiNames : ",component.get("v.colApiNames"));
        
        var data = component.get("v.allData"),
            term = component.get("v.filter"),
        	apiNames = component.get("v.colApiNames");
        
        var selectedRecs = [];
        for(var i = 0 ; i < data.length ; i++){
            for(var j = 0 ; j < apiNames.length ; i++){
                var k =apiNames[j];
                if(data[i].hasOwnProperty(k)){
                    if(data[i][apiNames[j]] == term){
                        selectedRecs.push(data[i]);
                    }
                }
            }
        }
        component.set("v.data",selectedRecs);*/
    }
})