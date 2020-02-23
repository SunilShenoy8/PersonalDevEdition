({
	
    initHelper : function(component,event){
        var self = this;
        console.log("entered init helper");
        var objDetail = {objApiName:"Contact", objLabel:"Contact"};
        this.invokeApexGeneric(component,"c.getFieldSet",undefined, function(objectDetail){
            console.log("Map of <ObjectName,List<Fieldset>> : ",objectDetail);
            component.set("v.sObjectDetail",objectDetail.objApiName);
            component.set("v.fieldDetails",objectDetail.objectFields);
            console.log("obj name : ",component.get("v.sObjectDetail")," Fields set  : ",component.get("v.fieldDetails"));
            self.invokeTableView(component);
        });
        
        /*console.log('objDetails : ',objDetail);
        component.set("v.sObjectDetail",objDetail);
        
        var fieldDetailList = [
        {
            "fieldLabel": "Salutation",
            "fieldApiName": "salutation",
            "fieldType": "PICKLIST",
            "pickListVal": ["Mr.", "Ms.", "Mrs.", "Dr.", "Prof."],
            "referenceTo": "",
            "isRequiredField": false
        },
        {
            "fieldLabel": "Last Name",
            "fieldApiName": "lastname",
            "fieldType": "STRING",
            "pickListVal": [],
            "referenceTo": "",
            "isRequiredField": true
        },
        {
            "fieldLabel": "Account ID",
            "fieldApiName": "accountid",
            "fieldType": "REFERENCE",
            "pickListVal": [],
             "referenceTo": {"Name" : "Account", "Plural" : "Accounts"},
            "isRequiredField": false
        },
        {
            "fieldLabel": "Mobile Phone",
            "fieldApiName": "mobilephone",
            "fieldType": "PHONE",
            "pickListVal": [],
            "referenceTo": "",
            "isRequiredField": false
        },
        {
            "fieldLabel": "Birthdate",
            "fieldApiName": "birthdate",
            "fieldType": "DATE",
            "pickListVal": [],
            "referenceTo": "",
            "isRequiredField": false
        },
        {
            "fieldLabel": "Amount",
            "fieldApiName": "amount__c",
            "fieldType": "DOUBLE",
            "pickListVal": [],
            "referenceTo": "",
            "isRequiredField": false
        },
        {
            "fieldLabel": "Test Lead Info",
            "fieldApiName": "test_lead_info__c",
            "fieldType": "STRING",
            "pickListVal": [],
            "referenceTo": "",
            "isRequiredField": false
        },
        {
            "fieldLabel": "Contact Description",
            "fieldApiName": "description",
            "fieldType": "TEXTAREA",
            "pickListVal": [],
            "referenceTo": "",
            "isRequiredField": false
        }];
        component.set("v.fieldDetails",fieldDetailList);
        console.log('field detail list : ',component.get("v.fieldDetails"));*/
    },
    invokeTableView : function(component){
        $A.createComponent(
            "c:WD_Table",
            {
                "selectedObjectApi": component.get("v.sObjectDetail"),
                "selectedObjectLabel": component.get("v.sObjectDetail"),
                "fieldDetails": component.get("v.fieldDetails")
            },
            function(tableView, status, errorMessage){
                if (status === "SUCCESS") {
                    console.log("Created Table view successfully");
                    component.set("v.tableView",tableView);
                }
                else if (status === "INCOMPLETE") {
                    console.log("Failed to create table")
                }
                else if (status === "ERROR") {
                    console.log("Failed to create table " + errorMessage);
                }
            }
        );
      
    },
    invokeApexGeneric : function(component, functionName,paramsObj,callBack){
        let action = component.get(functionName);
        if(paramsObj != undefined){
            	action.setParams(paramsObj);
        }
        action.setCallback(this, (response) => {
            let state = response.getState();
            if (component.isValid() && state === 'SUCCESS') {
            	console.log("functionName : "+functionName+" status : SUCCESS : Return Value : ",response.getReturnValue());
            	callBack (response.getReturnValue());
            
        	} else if (state === "ERROR") {
            	console.log("functionName : status : ERROR")
        	}
    	});
    	$A.enqueueAction(action);
	},
})