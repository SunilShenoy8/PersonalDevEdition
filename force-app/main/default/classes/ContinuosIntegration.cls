public class ContinuosIntegration{
    public static void fetchAllAccounts(){
        System.debug([SELECT Id,Name From Account]);
    }
}