public class GeneralLightningApex {
    @AuraEnabled
    public static Boolean saveContactRec(String jsonContactStr){
        System.debug('JSON String --> '+jsonContactStr);
        Contact con = (Contact) Json.deserialize(jsonContactStr, Contact.class);
        
        Database.SaveResult sr = Database.insert(con);
        if(sr.isSuccess()){
            return true;
        }
        return false;
    }

}