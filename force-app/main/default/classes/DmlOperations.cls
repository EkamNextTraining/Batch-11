public class DmlOperations {
/*
DML - data manipulation language - it is used to perform actions on records and stores them into the SF Database
Insert - creating new records
Update - modifies the existing records
Delete - delete the records
Undelete - restores the records
Upsert - insert/update
Merge - combines duplicate records

Database Methods - it will allow partial success, instead of stopping all the records when one record is wrong it will stop error record and insert remaining records
 */
    public static void createAccount(){
        Account acc = new Account();
        
        acc.Name = 'Salesforce Tech';
        acc.Phone = '3245678912';
        acc.Industry = 'Technology';
        
        insert acc;
        System.debug('Account Id: ' + acc.Id);
    }
    
    public static void updateAccount(){
        Account acc = [SELECT Id, Name, Phone FROM Account WHERE Name = 'Salesforce Tech' LIMIT 1];
        acc.Phone = '1234567890';
        update acc;
        System.debug('Account updated');
    }
    public static void deleteAccount(){
         Account acc = [SELECT Id, Name FROM Account WHERE Name = 'Salesforce Tech' LIMIT 1];
        delete acc;
        System.debug('Account deleted');
        
    }
    
    public static void restoreAccount(){
        List<Account> deleteAccounts = [SELECT Id, Name FROM Account WHERE Name = 'Salesforce Tech' AND IsDeleted = true ALL ROWS];
        if(!deleteAccounts.isEmpty()){
            undelete deleteAccounts[0];
            System.debug('Account Restored');
        }else {
            System.debug('not found');
        }
    }
    public static void upsertAccount(){
        Account acc = new Account();
        acc.Name = 'Test Apple';
        acc.Phone = '2314567890';
        acc.Type = 'Prospect';
        upsert acc;
        System.debug('Account Id: ' + acc.Id);
    }
     public static void deleteAccounts(){
         Account acc = [SELECT Id, Name FROM Account WHERE Name =  'Test Apple' LIMIT 1];
        delete acc;
        System.debug('Account deleted');
        
    }
    public static void permanentDeleteAccount(){
        List<Account> accList = [SELECT Id, Name FROM Account Where Name = 'Test Apple' AND IsDeleted = true ALL ROWS];
        if(!accList.isEmpty()){
            Database.emptyRecycleBin(accList);
            System.debug('Account deleted totally');
            
        }else {
            System.debug('not deleted');
        }
    }
    public static void createAccounts(){
        List<Account> accList = new List<Account>();
        accList.add(new Account(Name = 'Sales output'));
        accList.add(new Account(Name = 'Sales output 1'));
        accList.add(new Account(Name = 'Sales output 2'));
        insert accList;
        System.debug('Total accounts inserted');
    }
    
    public static void createAccountsUsingDatabase(){
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name = 'Test DML'));
        accounts.add(new Account(Name = 'DML Data'));
        accounts.add(new Account());
        
        Database.SaveResult[] results = Database.insert(accounts, false);
        for(Integer i=0; i < results.size(); i++){
        if(results[i].isSuccess()){
            System.debug('Account Id: ' + results[i].getId());
        } else {
            for(Database.Error err : results[i].getErrors()){
                System.debug('Error : ' + err.getMessage());
            }
        }
    }

}
}