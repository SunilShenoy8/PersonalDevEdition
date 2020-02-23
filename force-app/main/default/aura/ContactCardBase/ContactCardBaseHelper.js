({
	loadContacts : function(component,event) {
        var self = this;
        var params = {"accountId" : component.get("v.recordId")};
		this.invokeController (component, 'c.getContactsByAccountId',params)
        	.then (
            $A.getCallback(result => {
                console.log ('List Of Contacts :', result);
                self.displayContacts(component,result);
            }),
            $A.getCallback(error => {
                console.log ('Error in getPrivateData:', error);
            })
        )
	},
    displayContacts : function(component,contactList){
        $A.createComponent(
            "c:ContactCard",
            {
                "contactList": contactList
            },
            (child, status, errorMessage) => {
                if (status === 'SUCCESS') {
                	console.log('Child created :  SUCCESS'); 
                    component.set('v.body', child);
                }
                else {
                    console.log('ERROR: child - '+status);
                }
            }
        );
    }
                
})