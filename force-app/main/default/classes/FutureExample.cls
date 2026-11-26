public class FutureExample {

/*
Async Apex - code is submitted later and processed in the background
1.Future Method - used for simple tasks in the background and supported callouts @future
2.Queueable Apex - job chaining is possible, runs a job in the backgorund complex data, job id Queueable
3.Batch Apex - processing the large amount of data 50000 it will divide into chunks the basic limit of each chunk is 200 records Database.Batchable<SObject>
4.Scheduled Apex - executes apex at a specific time Schedulable
 */
    
    @future
    public static void updateContactDescription(Id contactId){
        Contact con = [SELECT Id, Description FROM Contact WHERE Id = :contactId];
        con.Description = 'Updated using future apex';
        update con;
    }

}