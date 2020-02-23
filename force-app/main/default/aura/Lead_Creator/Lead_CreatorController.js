({
	doInit : function(component, event, helper) {
        console.log('Entered Do init method: Record Id : '+component.get("v.recordId"));
        helper.getobjectNameByRecordId(component,event);
	},
    onClickHandler : function(component, event, helper) {
        console.log('onclick : ');
        if( component.get('v.sObjectDetail') ){
            console.log("sObjectDetail not null");
            component.set("v.flagToCall",true);
        }
    }
})