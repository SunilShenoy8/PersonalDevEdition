({
	initHelper : function(component,event) {
        console.log('**entered helper of initHelper**');
        var selectedObj =component.get("v.selectedObjectApi");
        console.log('selected object is : '+selectedObj);
        
        var selectedObjLabel = component.get("v.selectedObjectLabel");
        console.log('selected object label : '+selectedObjLabel);

        
        // Set Error Flag Initial value as false
        component.set("v.errorFlagForNoFields",false);
		
        //component.set("v.data",{fields : '' });

        console.log("Field Details : ",component.get("v.fieldDetails"));
        
        //Involk First Row
        this.addRowHelper(component,event);

	},
    addRowHelper : function(component,event){

        console.log('Addding Row');

        var field = [];
        var fieldData = component.get('v.fieldDetails');
        for(var i=0; i<fieldData.length; i++){
            field.push({ 
                		name : fieldData[i].fieldApiName , 
                         value : "" , 
                         type : fieldData[i].fieldType , 
                         pickVals : fieldData[i].pickListVal , 
                         isRequired : fieldData[i].isRequiredField,
                         referenceTo : fieldData[i].referenceTo
                       });
        }

        var data = component.get('v.data');
        var dt = {};
        //For Data Records
        dt.fields = field;
        // For checkbox
        dt.isSelected = false;
        // apend the data to existing list
        data.push(dt);
        console.log("after apending : ",data);
        component.set("v.data", data);
    },
    removeRowHelper : function(component,event){
        var data = component.get("v.data");
        var recordsTORemove = [];
        if(data != null || data.length > 0 )   {
            if(data.length == 1 && data[0].isSelected){
                this.dispToast('Warning !','Cannot remove row. Only one row left.','warning');
            }
            else{
                for( var i = 0 ; i < data.length ; i++){
                    if(data[i].isSelected){
                        //delete data[i];
                        data.splice( i, i+1 );
                        recordsTORemove.push(data[i]);
                    }
                }
            }
        }
        if(recordsTORemove.length < 1  && data.length != 1 && data[0].isSelected == false){
            this.dispToast('Error !','Please select a record to remove','error');
        }
        component.set("v.data", data);
        console.log("after remove row : ",component.get("v.data"));
    },
    SaveDataHelper : function(component,event){
        console.log("Entered to save data");
        var dataToSave = component.get("v.data");
        console.log('No of records : ',dataToSave);
        var selectedObj = component.get("v.selectedObjectApi");
        var outputData = [];
        if(dataToSave != null || dataToSave.length > 0 )   {
            for( var i = 0 ; i < dataToSave.length ; i++){
                if(dataToSave[i].isSelected){
                    outputData.push(dataToSave[i]) ;
                }
            }
        }     
        
        if(outputData.length > 0){
            //Handling null values in required fields
            var reqIsNull = false;
            for(var i = 0 ; i < outputData.length ; i++ )//start from first bcz 0 is empty always
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
                this.dispToast('Warning!','* Please Fill all the required field Details *','Warning');  
          
            }
            else{
                console.log("No required field is Null");
                component.set("v.errorFlagForNullRequiredFields","");
                
                //Saving the Records
                var fieldValList = [];
                for(var i = 0 ; i < outputData.length ; i++ )//start from first bcz 0 is empty always
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
                console.log('fieldListStr',fieldListStr);
                
                var action = component.get('c.saveRecordDetails');
                action.setParams({"fieldValList" : fieldListStr,"ObjNameStr" : component.get("v.selectedObjectApi")});
                console.log('saveRecordDetails : action data received: '+action);
                
                action.setCallback(this, function(response) {
                    var state = response.getState();
                    console.log('state : '+state);
                    if (state === "SUCCESS") 
                    {
                        console.log(response.getReturnValue());
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            "title": "Success!",
                            "type" : "success",
                            "message": "Successfully Inserted"
                        });
                        toastEvent.fire();
                        component.set("v.data",{fields : '' });
                        window.location.reload();
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
        }
        else{
            this.dispToast('Error !','Please select a record to Save','error');
        }

        
    },
    dispToast : function(title,message,type){
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title    : title,
            type     : type,
            message  : message,
            duration : 750
        });
        toastEvent.fire();
   },
   toggleSelectAll : function(component, event){
       console.log("In helper : toggleSelectAll");
       var checkBoxVal = component.find("selectAllCheck").get("v.value");
       var data = component.get("v.data");
       if(checkBoxVal){
           console.log("Check box is true ");   
           for(var i = 0 ; i < data.length ; i++ ){
               data[i].isSelected = true;
           }
       }
       else{
           console.log("Check box is false ");  
           for(var i = 0 ; i < data.length ; i++ ){
               data[i].isSelected = false;
           }
       }
       component.set("v.data",data);
   }


})