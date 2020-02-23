public with sharing class GoogleAnalyticsController {
    
    @AuraEnabled  public static UserData getCurrentUserData() {
        return new UserData();
    }
    
    //you will need to create a custom setting that contains the tracking Id 
    //(or hard code it if you are in a hurry)
    @RemoteAction
    @AuraEnabled public static String getTrackingId(){
		String Google_Analytics_Tracking_Id = 'UA-131088312-1';
        return Google_Analytics_Tracking_Id;
    }
    
    //I have included the whole userdata class as it might be handy
    //depending on what data you want to send to Google
    public class UserData{
        @AuraEnabled public String name {get;set;}
        @AuraEnabled public String firstName {get;set;}
        @AuraEnabled public String lastName {get;set;}
        @AuraEnabled public String profileId {get;set;}
        @AuraEnabled public String uiThemeDisplayed {get;set;}
        @AuraEnabled public String email {get;set;}
        @AuraEnabled public String id {get;set;}
        @AuraEnabled public String type {get;set;}
        @AuraEnabled public String roleId {get;set;}
        @AuraEnabled public String sessionId {get;set;}
        
        public UserData(){
            this.name =             UserInfo.getName();
            this.firstName =        UserInfo.getFirstName();
            this.lastName =         UserInfo.getLastName();
            this.profileId =        UserInfo.getProfileId();
            this.uiThemeDisplayed = UserInfo.getUiThemeDisplayed();
            this.email =            UserInfo.getUserEmail();
            this.id =               UserInfo.getUserId();
            this.type =             UserInfo.getUserType();
            this.roleId =           UserInfo.getUserRoleId();
            this.sessionId =        UserInfo.getSessionId();
            
        }
    }
}