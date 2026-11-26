public class ScheduleExample implements Schedulable {
    public void execute(SchedulableContext sc){
        Database.executeBatch(new BatchExample(), 200);
    }
        

}