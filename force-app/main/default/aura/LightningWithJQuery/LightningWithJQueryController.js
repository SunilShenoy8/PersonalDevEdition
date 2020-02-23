({
	jsLoaded : function(component, event, helper) {
		console.log("JQuery File loaded..");
	},
    handleClick : function(component, event, helper){
        console.log("Clicked");
        $("#text1").on("change",function(){
            console
        });
    },
})