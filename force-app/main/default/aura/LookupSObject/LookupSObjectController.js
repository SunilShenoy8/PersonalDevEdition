({
    /**
     * load selected value in init 
     */
    
    init : function(cmp, event, helper){
        helper.showSelectedLabel(cmp, event);  
    },
    
    /**
     * Search an SObject for a match
     */
	search : function(cmp, event, helper) {
        console.log('in search');
		helper.doSearch(cmp);        
    },

    /**
     * Select an SObject from a list
     */
    select: function(cmp, event, helper) {
        console.log('in select');
    	helper.handleSelection(cmp, event);
    },
    
    /**
     * Clear the currently selected SObject
     */
    clear: function(cmp, event, helper) {
        console.log('in clear');
    	helper.clearSelection(cmp);    
    }
})