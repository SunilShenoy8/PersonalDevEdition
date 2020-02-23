({
	readRaw: function(component, event, query, callbackFunction) {
        var readAction = component.get("c.ReadSObjects");
        readAction.setParams({
            query: query
        });
        readAction.setCallback(this, function(response) {
            var resp = response.getReturnValue();
            var returnableValue;
            if (response.getState() == 'SUCCESS') {
                
                if (resp.success == false) {
                    returnableValue = resp.errorMsg;
                } else {
                    returnableValue = resp.sObjList;
                }
                callbackFunction(returnableValue);
            }
        });
        $A.enqueueAction(readAction);
    },
})