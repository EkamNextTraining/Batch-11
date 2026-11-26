public class QueueableExample implements Queueable {
    private Id contactId;
    public QueueableExample(Id contactId){
        this.contactId = contactId;
    }
    public void execute(QueueableContext context){
        Contact con = [SELECT Id, Description FROM Contact WHERE Id = :contactId];
        con.Description = 'Updated using Queuebale Apex';
        update con;
    }

}