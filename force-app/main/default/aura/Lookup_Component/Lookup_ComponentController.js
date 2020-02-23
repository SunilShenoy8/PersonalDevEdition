({
    setShowList: function(component, event, helper) {

        //set the list showable triggers as afresh
        component.set('v.showList', true);
        component.set('v.objectList', []);
    },
    getObjects: function(component, event, helper) {

        //javascript initializations before query
        var textValue = event.getSource().get('v.value');
        var label = component.get('v.label');

        // if given search string is not null and not empty and its length is not less than 2, query the database
        var minCharacters = component.get('v.minCharacters');

        if (textValue != null && textValue != '' && textValue.length >= minCharacters) {

            // query maker variables
            var where = component.get('v.where');
            var fields = component.get('v.fields');
            var objectName = component.get('v.objectType');

            // query making
            var query = "select " + fields + " from " + objectName + " where Name Like '%" + textValue + "%' " + where + " LIMIT 50 ";
            console.log(query);
            // database search
            helper.readRaw(component, event, query, function(response) {
            	console.log(response);
                if (response !== null && response !== undefined) {
                //if (response["sObjectList"] != undefined && response["sObjectList"] != null) {
                    //set component list from response
                    component.set("v.objectList", []);
                    component.set("v.objectList", response);
                //} else {
                }else{
                    //set component list from response
                    component.set("v.objectList", []);

                    // log the response object in case of error or exception
                    console.log(label + " lookup went wrong, sObjectList returned is undefined or null,please " +
                        "check the returned response of lookup below->");
                    console.log(response);

                }


            });
        } else {

            // set object list as empty array
            component.set("v.objectList", []);
        }

    },
    setObject: function(component, event, helper) {

        
        //hide list
        component.set('v.showList', false);

        // get selected object
        var selectedObject = JSON.parse(JSON.stringify(event.getSource().get('v.text')));

        // set the name of that object in component
        component.set('v.objectName', selectedObject["Name"]);
        // Sravan
        component.set('v.selectedObject', selectedObject);
        component.set('v.objectList', []);

        // get the event and fire
        var onLookupSelect = component.getEvent('onLookupSelect');
        onLookupSelect.setParams({
            selectedObject: selectedObject
        });
        component.set('v.isSelected', true);
        onLookupSelect.fire();

    },
    throwBlur: function(component, event, helper) {
        component.set('v.isSelected', false);
        var onBlur = component.getEvent('onBlur');
        var textValue = component.find('lookup-textbox').get('v.value');
        onBlur.setParams({
            textValue: textValue
        });
        onBlur.fire();

    }
})