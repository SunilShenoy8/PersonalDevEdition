trigger DiscountAllowing on Books__c (before insert) {
    List<Books__c> bookList=Trigger.New;
    for(Books__c b:bookList)
    {
        Decimal amount=b.Dis__c;
        b.Dis__c=amount*0.9;
    }

}