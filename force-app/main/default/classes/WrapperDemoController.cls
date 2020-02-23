public class WrapperDemoController{
    /*Our Wrapper Class*/
    public class TableRow{
        public String Name      {get;set;}
        public String Phone     {get;set;}
        public String Company   {get;set;}
    }
   
    /*Public Property that will hold all the TableRows and our PageBlockTable can use this Variable   to get the whole List of rows*/
    public List<TableRow> RowList {get; set;}

    /*Constructor that runs a SOQL to get all the Records and build the List. This get executed automatically on the Page Load.*/
    public WrapperDemoController(){

        RowList = new List<TableRow>();
        TableRow tr;

        /*Building the List of TableRows*/
        /*Fetch all the Contacts and then build the List*/
        for(Contact con : [SELECT Name, Phone, Account.Name FROM Contact]){

            tr = new TableRow();
            tr.Name = con.Name;
            tr.Phone = con.Phone;
            tr.Company = con.Account.Name;

            /*Add the TableRow to the List then and there*/
            RowList.add(tr);
        }
    }
}