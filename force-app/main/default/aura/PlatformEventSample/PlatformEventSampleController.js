({
	onInit : function(component, event, helper) {
        
		// Get the empApi component
        const empApi = component.find('empApi');

        // Uncomment below line to enable debug logging (optional)
        empApi.setDebugFlag(true);

        // Register error listener and pass in the error handler function
        empApi.onError($A.getCallback(error => {
            // Error can be any type of error (subscribe, unsubscribe...)
            console.error('EMP API error: ', error);
        }));
        
        /* SUBSCRIBE */   
       // Replay option to get new events
        const channel = '/event/AccountChange__e';
        const replayId = -1;
        // Subscribe to an event
        empApi.subscribe(channel, replayId, $A.getCallback(eventReceived => {
            // Process event (this is called each time we receive an event)
            console.log('Received event ', JSON.stringify(eventReceived));
            var data = component.get("v.subscribtionList") != undefined ? component.get("v.subscribtionList") : [];
            data.push(eventReceived);
            component.set("v.subscribtionList",data);
        }))
        .then(subscription => {
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
            "title": "Success!",
            "message": "Subscribtion successfull"
        	});
        	toastEvent.fire();
            
            // Confirm that we have subscribed to the event channel.
            // We haven't received an event yet.
            console.log('Subscribed to channel ', JSON.stringify(subscription));
            // Save subscription to unsubscribe later
            
        });
            
        
	},
    subscribe : function(component,event){
            /* SUBSCRIBE */   
        // Get the empApi component
        const empApi = component.find('empApi');
        // Replay option to get new events
        const channel = '/event/AccountChange__e';
        const replayId = -1;
        // Subscribe to an event
        empApi.subscribe(channel, replayId, $A.getCallback(eventReceived => {
            // Process event (this is called each time we receive an event)
            console.log('Received event ', JSON.stringify(eventReceived));
            var data = component.get("v.subscribtionList") != undefined ? component.get("v.subscribtionList") : [];
            data.push(eventReceived);
            component.set("v.subscribtionList",data);
        }))
        .then(subscription => {
            
            // Confirm that we have subscribed to the event channel.
            // We haven't received an event yet.
            console.log('Subscribed to channel ', subscription);
            // Save subscription to unsubscribe later
            
        });
   }
})