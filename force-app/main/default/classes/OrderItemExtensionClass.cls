public class OrderItemExtensionClass {
   	private final Order od;
    public list<OrderItem> OrderiT {get;set;}
    private ApexPages.StandardController stdController;
    public OrderItemExtensionClass(ApexPages.StandardController stdController)
    {
        OrderiT=new list<OrderItem>();
        this.od=(Order)stdController.getRecord();
        System.debug(od.Id);
        OrderiT=[SELECT Id,OrderId,OrderItemNumber,Product2.name,Quantity,TotalPrice,UnitPrice FROM OrderItem where OrderId=:od.id];
    	System.debug(OrderiT);
    }

}