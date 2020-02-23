public class myAccountHandler {
	@AuraEnabled
	public static List<Contact> getcontactList(String recordId){
		List<Contact> retList = [SELECT id,Name,Email,Phone from Contact where AccountId=:recordId];
		System.debug(retList);
		return retList;
	}

}