public class NotificationCtrl {
    @AuraEnabled
    // exposes this method to Lightning component controller
    public static String getSessionId(){
        // uses std UserInfo utility class to get sessionId
        return UserInfo.getSessionId();
    }
}