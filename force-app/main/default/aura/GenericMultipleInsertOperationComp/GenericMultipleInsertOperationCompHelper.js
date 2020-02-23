({
	// Fetches all object Api names
	fetchAllObjectsApiNames : function(component,event) {
		console.log('**entered helper**');
		var action = component.get('c.getAllObjectApiNames');
		action.setParams({});
        //console.log('action data received: '+action);

		action.setCallback(this, function(response) {
        	var state = response.getState();
            if (state === "SUCCESS") 
            {
                var AllObjectsApiNameList = response.getReturnValue();
                console.log('data received: '+AllObjectsApiNameList);
                if((AllObjectsApiNameList != null && AllObjectsApiNameList.length>0)){
                    component.set("v.objectApiList", AllObjectsApiNameList);
                }  
            }
            else if (state === "INCOMPLETE") {
            }
            else if (state === "ERROR") {
            	var errors = response.getError();
                if (errors) {
                	if (errors[0] && errors[0].message) {
                    	console.log("Error message: " +errors[0].message);
                    }
                }
                else {
                	console.log("Unknown error");
                }
            }
        });
        
        $A.enqueueAction(action);
	},

	onChangeHelper : function(component,event) {
        console.log('**entered helper of onchange**');
		console.log('Selected object is : '+event.getSource().get("v.value"));
		var selectedObj = event.getSource().get("v.value");
        component.set("v.selectedObjectApi",selectedObj);

        // Get Label of object
        var allObjList = component.get("v.objectApiList");
        var selectedObjLabel = "";
        for(var i = 0 ; i < allObjList.length ; i++){
            if(allObjList[i].fieldApiName == selectedObj ){
                selectedObjLabel = allObjList[i].fieldLabel;
                console.log("selected object Label : "+selectedObjLabel);
                break;
            }
        }
        if(selectedObjLabel != ""){
            component.set("v.selectedObjectLabel",selectedObjLabel);
        }
        // End get label
        
        // Set Error Flag Initial value as false
        component.set("v.errorFlagForNoFields",false);
		

        //Fetches all fields
		var action = component.get('c.getFetchAllFieldNames');
		action.setParams({objName : selectedObj});
        console.log('action data received: '+action);

		action.setCallback(this, function(response) {
        	var state = response.getState();
            if (state === "SUCCESS") 
            {
            	var mapOfFields = [];
                var listOfFields = [];
                var picklistFieldNames = [];
                var fieldDetails = component.get('v.fieldDetails');
                fieldDetails = [];
                var selectedObjectsFieldsName = response.getReturnValue();
                console.log("Full Details of Data received : ");
                console.log(selectedObjectsFieldsName);
                if(selectedObjectsFieldsName.length > 0){
                    for(var i = 0;i < selectedObjectsFieldsName.length;i++) {
                        //console.log('data received: '+selectedObjectsFieldsName[i].fieldLabel +" Api name : "+selectedObjectsFieldsName[i].fieldApiName+" Type : "+selectedObjectsFieldsName[i].fieldType);
                        fieldDetails.push(selectedObjectsFieldsName[i]);           
                    }
                    component.set('v.fieldDetails', fieldDetails);
                    component.set("v.data",{fields : '' });
                    component.set("v.isObjectSelected",true);
                    //Involk First Row
                    this.addRowHelper(component,event);
                }
                else{
                    component.set("v.errorFlagForNoFields",true);
                }
                
            }
            else if (state === "INCOMPLETE") {
            }
            else if (state === "ERROR") {
            	var errors = response.getError();
                if (errors) {
                	if (errors[0] && errors[0].message) {
                    	console.log("Error message: " +errors[0].message);
                    }
                }
                else {
                	console.log("Unknown error");
                }
            }
        });
        
        $A.enqueueAction(action);

	},
    addRowHelper : function(component,event){

        console.log('Addding Row');

        var field = [];
        var fieldData = component.get('v.fieldDetails');
        for(var i=0; i<fieldData.length; i++){
            field.push({ name : fieldData[i].fieldApiName , 
                         value : "" , 
                         type : fieldData[i].fieldType , 
                         pickVals : fieldData[i].pickListVal , 
                         isRequired : fieldData[i].isRequiredField
                       });
        }

        var data = component.get('v.data');
        var dt = {};
        dt.fields = field;
        data.push(dt);
        console.log(data);
        component.set("v.data", data);
    },
    removeRowHelper : function(component,event){
        var data = component.get("v.data");
        data.pop();
        component.set("v.data", data);
    },
    SaveDataHelper : function(component,event){
        console.log("Entered to save data");
        var outputData = component.get("v.data");
        console.log(outputData);
        var selectedObj = component.get("v.selectedObjectApi");
        
        
        //Handling null values in required fields
        var reqIsNull = false;
        for(var i = 1 ; i < outputData.length ; i++ )//start from first bcz 0 is empty always
        {
            console.log('Object : ');
            console.log(outputData[i].fields);
            for(j = 0 ; j < outputData[i].fields.length ; j++)
            {
                console.log(outputData[i].fields[j]);
                var field = outputData[i].fields[j];
                if(field.isRequired == true && field.value == ""){
                    reqIsNull = true ; 
                    break;
                }
            }
           
        }
        
        if(reqIsNull){
            console.log("Required Field is Null");
            component.set("v.errorFlagForNullRequiredFields","* Please Fill all the required field Details *");
        }
        else{
            console.log("No required field is Null");
            component.set("v.errorFlagForNullRequiredFields","");
            
            //Saving the Records
            var fieldValList = [];
            for(var i = 1 ; i < outputData.length ; i++ )//start from first bcz 0 is empty always
            {
                var data = {};
                var dataArr = {};
                for(j = 0 ; j < outputData[i].fields.length ; j++)
                {
                    var field = outputData[i].fields[j];
                    console.log('Values'+field.value);
                    if(field.value != ''){
                        data[field.name] = field.value ; 
                    }
                }
                //dataArr[selectedObj] = data;
                fieldValList.push(data);
            }
            console.log("Fields List");
            console.log(fieldValList);
                        
            var fieldListStr = JSON.stringify(fieldValList);
            console.log(fieldListStr);
            
            var action = component.get('c.saveRecordDetails');
            action.setParams({"fieldValList" : fieldListStr,"ObjNameStr" : component.get("v.selectedObjectApi")});
            console.log('action data received: '+action);
    
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") 
                {
                    console.log(response.getReturnValue());
                }
                else if (state === "INCOMPLETE") {
                }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " +errors[0].message);
                        }
                    }
                    else {
                        console.log("Unknown error");
                    }
                }
            });
            
            $A.enqueueAction(action);
        }
        
        
        
        
        
        /*var typeArr = [];
        var valueArr = [];
        console.log(inputData);
        for(var i = 0 ; i < inputData.length ; i++){
            var typeStr = "";
            var valueStr = "";
            for(var j = 0 ; j < inputData[i].fields.length ; j++){
                console.log("FieldName : "+inputData[i].fields[j].name+" Value entered : "+inputData[i].fields[j].value);
                typeStr += inputData[i].fields[j].name + "**";
                valueStr += inputData[i].fields[j].value + "**";
                console.log("typestr : "+typeStr+"valuestr :"+valueStr);
            }
            typeArr[i] = typeStr;
            valueArr[i] = valueStr;
        }
        for(var i = 0 ; i < inputData.length ; i++){
            console.log(i+" "+typeArr[i]+" "+valueArr[i]);
        }
        var action = component.get('c.saveRecordDetails');
        action.setParams({"typeArr" : typeArr,"valueArr" : valueArr});
        console.log('action data received: '+action);

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") 
            {
                console.log(response.getReturnValue());
            }
            else if (state === "INCOMPLETE") {
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " +errors[0].message);
                    }
                }
                else {
                    console.log("Unknown error");
                }
            }
        });
        
        $A.enqueueAction(action);*/

    },


})