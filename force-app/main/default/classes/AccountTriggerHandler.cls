public class AccountTriggerHandler {
    public static void valiadateRecord(List<Account> records){
        for(Account acc : records){
            if(acc.Type == 'Prospect'){
                //Message will be displayed for a record
                acc.addError('Account Record cannot be created/updated with Type as Prospect.');
                //Message will be displayed under a field for a record
                acc.Type.addError('Account Record cannot be created/updated with Type as Prospect.');
            }
        }
    }
    public static void fastFieldUpdates(List<Account> records){
        for(Account acc : records){
            if(acc.Type == 'Other'){
                acc.Fax = '9876543210';
            }
        }
    }
    public static void preventAccountDelete(List<Account> records){
        for(Account acc : records){
            if(acc.Rating == 'Hot'){
                acc.Rating.addError('Account Record cannot be deleted if the rating is Hot.');
            }
        }
    }
    // old & oldMap - to fetch previous values of fields
    // new & newMap - to fetch latest values of fields
    public static void compareRatingValue(List<Account> records, Map<Id,Account>oldRecords){
        for(Account acc : records){
            if(acc.Rating == 'Cold' && oldRecords.get(acc.Id).Rating == 'Hot'){
                acc.Rating.addError('Account Rating cannot be updated directly from Hot to Cold');
            }
        }
    }
    //create five contacts when a account record is created
    public static void createContacts(List<Account> records){
        List<Contact> contacts =  new List<Contact>();
        for(Account acc : records){
            contacts.add(new Contact(LastName=acc.Name+' 1', AccountId=acc.Id));
            contacts.add(new Contact(LastName=acc.Name+' 2', AccountId=acc.Id));
            contacts.add(new Contact(LastName=acc.Name+' 3', AccountId=acc.Id));
            contacts.add(new Contact(LastName=acc.Name+' 4', AccountId=acc.Id));
            contacts.add(new Contact(LastName=acc.Name+' 5', AccountId=acc.Id));
        }
        insert contacts;
    }
    //create five Opportunity when a account record is created
    public static void createOpportunities(List<Account> records){
        List<Opportunity> opps =  new List<Opportunity>();
        for(Account acc : records){
            opps.add(new Opportunity(Name=acc.Name+' 1', AccountId=acc.Id, CloseDate=system.today(),StageName='Prospecting'));
            opps.add(new Opportunity(Name=acc.Name+' 2', AccountId=acc.Id, CloseDate=system.today(),StageName='Prospecting'));
            opps.add(new Opportunity(Name=acc.Name+' 3', AccountId=acc.Id, CloseDate=system.today(),StageName='Prospecting'));
            opps.add(new Opportunity(Name=acc.Name+' 4', AccountId=acc.Id, CloseDate=system.today(),StageName='Prospecting'));
            opps.add(new Opportunity(Name=acc.Name+' 5', AccountId=acc.Id, CloseDate=system.today(),StageName='Prospecting'));
        }
        insert opps;
    }
}