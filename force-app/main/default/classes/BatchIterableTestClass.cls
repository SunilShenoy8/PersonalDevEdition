public class BatchIterableTestClass implements Iterator<Contact> {

  Contact[] results { get;set; }
  Integer index { get;set; }
  String query='select id,name,email from Contact Limit 20';

  public BatchIterableTestClass() {
    index = 0;
    results = Database.query(query);   
  }

  public Boolean hasNext(){ 
   return results != null && !results.isEmpty() && index < results.size(); 
  }    

  public Contact next() { 
    return results[index++];
  }    

}