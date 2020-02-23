public class ScheduleJobTest implements Schedulable{
	public static void execute(SchedulableContext sc)
    {
        Account newAcc=new Account(Name='Scheduled job Account');
        insert newAcc;
    }
}