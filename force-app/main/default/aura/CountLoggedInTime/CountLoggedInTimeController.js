({
	setup : function(component, event, helper) {
        
        window.addEventListener('focus', this.startTimer(component));
        
        // Inactive
        window.addEventListener('blur', this.stopTimer(component));
	},
    startTimer : function(component){
        component.set("v.IntervalVal",window.setInterval(function(component){
            var val = component.get("v.countVal");
            val += 1;
            component.set("v.countVal",val);
        }, 1000));
    },
    stopTimer : function(component){
        window.clearInterval(component.set("v.IntervalVal"));
    }
    
    
})