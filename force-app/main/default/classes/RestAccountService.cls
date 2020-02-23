@RestResource(urlMapping='/v1/accounts/*')
global with sharing class RestAccountService  {

    @HttpGet
    global static List<AccountWrapper> show() {

        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        List<AccountWrapper> acc_wraper = new List<AccountWrapper>();

        String phoneNum = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        System.debug('account id : '+phoneNum);

        if(dosearch(phoneNum)){
            String searchPhoneNum = '%'+req.params.get('Phone')+'%';
            System.debug('searched phone number is : '+searchPhoneNum);
            List<Account> accList = [SELECT Id,Name,Phone,Website,BillingState FROM Account WHERE phone LIKE : searchPhoneNum];
            if(accList.size()>0 && accList != null){
                for(Account ac : accList){
                    AccountWrapper aw = new AccountWrapper();
                    aw.acc = ac;
                    aw.status = 'success';
                    aw.msg = 'successfull transaction';
                    acc_wraper.add(aw);
                }
            }
            else{
                AccountWrapper aw = new AccountWrapper();
                aw.acc = null;
                aw.status = 'Error';
                aw.msg = 'This account could not be found,please try again';
                res.statusCode = 404;
                acc_wraper.add(aw);
            }
        }

        
        return acc_wraper;

    }

    private static boolean dosearch(String val){
        if(val.equals('accounts'))
            return true;
        else
            return false;
    }

    global class AccountWrapper{
        public Account acc;
        public String status;
        public String msg;

        public AccountWrapper(){}
    }

    @HttpPost
    global static AccountWrapper create(String name,String phone,String website) {
        AccountWrapper aw = new AccountWrapper();
        Account ac = new Account();
        ac.Name = name;
        ac.Phone = phone;
        ac.Website = website;
        insert ac;
        aw.acc = ac;
        aw.status = 'Success';
        aw.msg = 'successfull transaction';

        return aw;

    }

    @HttpPut
    global static Account updateObject() {

        Account obj;

        return obj;

    }

    @HttpDelete
    global static void remove() {

    }



}