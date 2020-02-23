({
    getAccounts : function(component, helper) {
        var action = component.get("c.getLimitedAccounts");
        action.setStorable();
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('Response Time: '+((new Date().getTime())-requestInitiatedTime));
                component.set("v.totalPages", Math.ceil(response.getReturnValue().length/component.get("v.pageSize")));
                // Process of adding record URL
                var records = response.getReturnValue();
                records.forEach(function(record){
                    record.linkName = '/'+record.Id;
                });
                component.set("v.allData", response.getReturnValue());
                component.set("v.currentPageNumber",1);
                helper.buildData(component, helper);
            }
        });
        var requestInitiatedTime = new Date().getTime();
        $A.enqueueAction(action);
    },
    buildFieldNameList : function(component,event){
        var allColsMetadata = component.get("v.columns");
        var colApiNames = [];
        for(var i = 0 ; i < allColsMetadata.length; i++){
            if(allColsMetadata[i].hasOwnProperty('fieldName')){
                colApiNames.push(allColsMetadata[i].fieldName);
            }
        }
        if(colApiNames.length > 0 ){
            component.set("v.colApiNames",colApiNames);
        }
    },
    /*
     * this function will build table data
     * based on current page selection
     * */
    buildData : function(component, helper) {
        var data = [];
        var pageNumber = component.get("v.currentPageNumber");
        var pageSize = component.get("v.pageSize");
        var allData = component.get("v.allData");
        var x = (pageNumber-1)*pageSize;
        
        //creating data-table data
        for(; x<=(pageNumber)*pageSize; x++){
            if(allData[x]){
            	data.push(allData[x]);
            }
        }
        component.set("v.data", data);
        
        helper.generatePageList(component, pageNumber);
    },
    
    /*
     * this function generate page list
     * */
    generatePageList : function(component, pageNumber){
        pageNumber = parseInt(pageNumber);
        var pageList = [];
        var totalPage = component.get("v.totalPages");
        if(pageNumber<5){
            pageList.push(2,3,4,5,6);
        } else if(pageNumber>(totalPage-5)){
            pageList.push(totalPage-5, totalPage-4, totalPage-3, totalPage-2, totalPage-1);
        } else{
            pageList.push(pageNumber-2, pageNumber-1, pageNumber, pageNumber+1, pageNumber+2);
        }
        component.set("v.pageList", pageList);
    },
    
    sortData: function (cmp, fieldName, sortDirection) {
        var data = cmp.get("v.data");
        var reverse = sortDirection !== 'asc';

        data = Object.assign([],
            data.sort(this.sortBy(fieldName, reverse ? -1 : 1))
        );
        cmp.set("v.data", data);
    },
    sortBy: function (field, reverse, primer) {
        var key = primer
            ? function(x) { return primer(x[field]) }
            : function(x) { return x[field] };

        return function (a, b) {
            var A = key(a);
            var B = key(b);
            return reverse * ((A > B) - (B > A));
        };
    },
   
 })