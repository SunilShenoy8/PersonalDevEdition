({
	selectedMenuItem : function(component, event, helper) {
        console.log('selected menu item : ',event.currentTarget.getAttribute('data-item'));
        component.set('v.currentMenuItem',event.currentTarget.getAttribute('data-item'));
	}
})