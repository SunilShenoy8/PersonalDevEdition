/******************************************************************************************
Class Name:  AddressSearchController
Description: This class is used t0 call google location API for auto complete functionality
******************************************************************************************/
public class AddressSearchController {
    
    //Method to get address details in the initial load
    /*@AuraEnabled
    public static AddressDetails__c getAddressDetailsbyId(String id){
        AddressDetails__c ad = new AddressDetails__c();
        ad = [select Id, City__c, State__c, Country__c, PostalCode__c, Street__C  from AddressDetails__c where Id=: id];
        return ad;
    }
    
    //Method to save address details on click on Save button
    @AuraEnabled
    public static String saveAddressDetailsbyId(String id, AddressDetails__c addDetails){
        system.debug('saveAddressDetailsbyId method');
        AddressDetails__c obj = [select Id from AddressDetails__c where Id=: id];
        obj.City__c = addDetails.City__c;
        obj.State__c = addDetails.State__c;
        obj.Country__c = addDetails.Country__c;
        obj.PostalCode__c = addDetails.PostalCode__c;
        obj.Street__c = addDetails.Street__c;
        update obj;
        return 'Success';
    }*/
    
    //Method to call google API and fetch the address recommendations 
    @AuraEnabled(cacheable=true)
    public static String getAddressSet(String SearchText){
        String APIKey = 'AIzaSyDXs7HKFTwKZTPrc9Bzk4E9VuqkMjJVYB8';
        String result = null;
        system.debug('SearchText is ' + SearchText);
        try{
            if(SearchText != null){
                String APIUrl = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=' + SearchText.replace(' ', '%20') + '&key=' + APIKey; 
                system.debug('APIUrl is ' + APIUrl);
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setEndpoint(APIURL);
                Http http = new Http();
                HttpResponse res = http.send(req);
                Integer statusCode = res.getStatusCode();
                system.debug('statusCode is ' + statusCode);
                if(statusCode == 200){
                    system.debug('API invoked successfully');
                    result = res.getBody();
                }
            }
        }
        catch(exception e){
            //Handling exception
            system.debug(e.getMessage());
        }
        return result;
    }
    
    //Method to call google API and fetch the address details by addressID 
    @AuraEnabled(cacheable=true)
    public static String getAddressDetailsByPlaceId(String PlaceID){
        String APIKey = '';
        String result = null;
        system.debug('SearchText is ' + PlaceID);
        try{
            if(PlaceID != null){
                String APIUrl = 'https://maps.googleapis.com/maps/api/place/details/json?placeid=' + PlaceId.replace(' ', '%20') + '&key=' + APIKey; 
                system.debug('APIUrl is ' + APIUrl);
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setEndpoint(APIURL);
                Http http = new Http();
                HttpResponse res = http.send(req);
                Integer statusCode = res.getStatusCode();
                system.debug('statusCode is ' + statusCode);
                if(statusCode == 200){
                    system.debug('API invoked successfully');
                    result = res.getBody();
                }
            }
        }
        catch(exception e){
            //Handling exception
            system.debug(e.getMessage());
        }
        return result;
    }
}