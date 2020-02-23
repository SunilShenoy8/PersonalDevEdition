({
	invokeController : function(component, funName, param) {
        let promise = new Promise ((resolve, reject) => {
            let action = component.get (funName);
            
            if (param != undefined) {
            	action.setParams (param);
        	}
                                  
            action.setCallback (this, (response) => {
                if (component.isValid() && response.getState() === 'SUCCESS') {
                    resolve(response.getReturnValue());
                } else{
                    reject(new Error(response.getError ()[0].message));
                }
        	});
    
    		$A.enqueueAction(action);
        });
        
        return promise;
	}
})