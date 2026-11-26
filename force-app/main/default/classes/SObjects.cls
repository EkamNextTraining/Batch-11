public class SObjects {
/*
Generic sObject  - dynamically assigning the values in the object
Bulkification - it is a process of writing apex code that can process multiple records at once instead of prcessiong only one record at a time
SOQL - 100 per transaction
DML - 150
Records that retrived by soql - 50000
records processes by one dml statement - 10000

 */
    public static void createRecord(String objectName){
        Schema.SObjectType objType = Schema.getGlobalDescribe().get(objectName);
        if(objType == null){
            System.debug('Invalid object name: ' + objectName);
            return;
        }
        SObject record = objType.newSObject();
        record.put('Name', 'Dynamic Test Record');
        Insert record;
        System.debug('Created record');
    }
    
    public static void displayContacts(List<Account> accountList){
        Set<Id> accountIds = new Set<Id>();
        for(Account acc : accountList){
            if(acc.Id != null){
                accountIds.add(acc.Id);
            }
        }
        List<Contact> contactList = [SELECT Id, Name, AccountId FROM Contact WHERE AccountId IN : accountIds];
        for(Contact con : contactList){
            System.debug('Account Id: ' + con.AccountId + 'Contact Name: ' + con.Name);
        }
        
      
    }
    public static void updateAccounts(List<Account> accountList){
        for(Account acc : accountList){
            acc.Rating = 'Hot';
          
        }
          update accountList;
    }
}