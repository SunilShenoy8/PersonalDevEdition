({
	doInit : function(component, event, helper) {
		// Retrieve contacts during component initialization
        helper.loadContacts(component);
	}
})