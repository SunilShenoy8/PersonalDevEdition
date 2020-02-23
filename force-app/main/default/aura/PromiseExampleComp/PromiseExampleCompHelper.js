({
	doInit : function(component, event) {
        
        this.invokeController (component, 'c.getPrivateData')
        	.then (
                $A.getCallback(result => {
                    console.log ('Result of getPrivateData :', result);
                    return result;
                }),
                $A.getCallback(error => {
                    console.log ('Error in getPrivateData:', error);
                })
        	)
            .then (
                $A.getCallback(result => {
                    return new Promise ((resolve, reject) => {
                        result ? resolve (this.getContactById (component, '0037F00000PlGkJQAV')) 
                                : reject (Error ('You cannot access privateData'));
                    });
                }),
                $A.getCallback(error => {
                    console.log ('Error in Second Promise:', error);
                })
        	)
            .then (
                $A.getCallback(result => {
                    console.log ('Result : ', result);
                    component.set ('v.result', result.Name +'       '+result.Email);
                    component.set ('v.isPrivateData', true);
                }),
                $A.getCallback(error => {
                    //handle Error
                    
                    console.log ('Error in third Promise:', error);
                    component.set ('v.Error', error.toString ());
                     component.set ('v.isPrivateData', false);
                })        
                
        	);
	},
	getContactById : function (component, conId) {
        return new Promise ((resolve, reject) => {
            this.invokeController (component, 'c.getContactById', {'contactId' : conId})
        		.then (
        			$A.getCallback(result => {
                        resolve (result);
                    }),
                    $A.getCallback(error => {
                       reject (error);
                    })  
        		);
        });
                  
	}
})