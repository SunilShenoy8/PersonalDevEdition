({
	init : function(component, event, helper) {
        var alldata = [{'status' : 'Approved','val' : 1},{'status' : 'Approved','val' : 2},{'status' : 'Declaned','val' : 1},{'status' : 'On Stop','val' : 1}, {'status' : 'Declaned','val' : 2}];
        
        
        var result = alldata.reduce(function (r, a) {
            r[a.status] = r[a.status] || [];
            r[a.status].push(a.val);
            return r;
        }, Object.create(null));

        console.log('Data in obj : ',result);
        
        var resultList = [];
        for (var k in result) {
            var obj = {};
            obj.status = k;
            obj.val = result[k];
            resultList.push(obj);
        }
        console.log('Final result : ',resultList);
        component.set("v.displayList",resultList);
        
	}
})