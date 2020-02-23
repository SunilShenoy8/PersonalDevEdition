({
	removeSelectedOptionCss : function(component,selected) {
        for(var i = 1 ; i <= 5 ; i++){
            if(i == parseInt(selected)){
                continue;
            }
            var cmpTarget = component.find(i+'');
            $A.util.removeClass(cmpTarget, 'roundclick');
        }
	}
})