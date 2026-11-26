public class BatchExample implements Database.Batchable<SObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, Description FROM Contact');
    }
    public void execute(Database.BatchableContext bc, List<SObject> scope){
        List<Contact> contactToUpdate = new List<Contact>();
        for(SObject record : scope){
            Contact con = (Contact) record;
            con.Description = 'Updated using Batch Apex';
            contactToUpdate.add(con);
        }
        update contactToUpdate;
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Batch Apex Processing completed');
    }

}