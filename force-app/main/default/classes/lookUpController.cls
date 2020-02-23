public class lookUpController {
	@AuraEnabled
     public static List < account > fetchAccount(String searchKeyWord,String objectName) {
         
         List < Sobject > returnList = new List < Sobject > ();
         String query='select id, Name from '+objectName+' where Name like\''+ '%'+searchKeyWord+'%\'';
		 List < Sobject > lstOfAccount=Database.query(query);
         
         for (Sobject acc: lstOfAccount) {
             returnList.add(acc);
         }
         return returnList;
     }
}