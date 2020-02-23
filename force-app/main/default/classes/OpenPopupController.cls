public class OpenPopupController {
    @AuraEnabled
    public static Boolean updateValues(String idVal,String nameVal, String Dept){
        Contact c = new Contact();
        c.Id = idVal;
        c.lastName = nameVal;
        c.Department = Dept;
        System.debug('Contact : '+c);
        update c;
        Database.SaveResult sr = Database.update(c);
        if(sr.isSuccess()){
            return true;
        }
        return false;
    }

}