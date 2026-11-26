public class SOQL { 
/*
SOQL - Salesforce Object Query Language - it is used to retrieve the records from salesforce objects
Syntax - SELECT Field1, Field2 FROM ObjectName WHERE Condition ORDER BY field1 LIMIT Numberofrecords

SELECT - specifies which field to be retrieve/fetch
FROM - specifies which salesforce object it has to fetch
WHERE - filters the records based on teh condition
ORDER BY - sorts the results
LIMIT- restricts number of records that should be return

[SELECT Id, Name, BillingCity FROM Account WHERE BillingCity = 'Hyderabad' AND Industry = 'Technology' / ORDER BY Name ASC/DESC / LIMIT 6];

COUNT() - count records
SUM() - add the field values
AVG() - Calculate the avg
MIN() - find minimum values
MAX() - find maximum values
Parent to child relationship query - it retrieves the records from parent object and also retrieves its related child objects
 */
    
    public static void getAccounts(){
        List<Account> accountList = [SELECT Id, Name, Type FROM Account WHERE Type = 'Customer - Direct' ORDER BY Name ASC LIMIT 3];
        
        for(Account acc : accountList){
            
            System.debug('Account Name: ' + acc.Name);
            System.debug('Type: ' + acc.Type);
            System.debug('Id: ' + acc.Id);
        }
    }
    
    public static void countOpportunities(){
        AggregateResult result = [SELECT COUNT(Id) totalCount FROM Opportunity];
        System.debug('Total Opportunities: ' + result.get('totalCount'));
        
    }
    
    public static void getAccountWithContacts(){
        List<Account> accountList = [SELECT Id, Name, (SELECT Id, FirstName, LastName, Email FROM Contacts) FROM Account];
        for (Account acc : accountList){
            System.debug('Account Name: ' + acc.Name);
            System.debug('Account Id: ' + acc.Id);
            for (Contact con : acc.Contacts){
                System.debug('Contact Name: ' + con.FirstName + ' ' + con.LastName);
                System.debug('Contact Email: ' + con.Email);
            }
        }
    }
    
    public static void getContactsWithAccounts(){
        List<Contact> contactList = [SELECT Id, FirstName, LastName, Email, Account.Name, Account.Industry FROM Contact];
        for(Contact con : contactList){
            System.debug('Contact Name: ' + con.FirstName + ' ' + con.LastName);
            System.debug('Contact Email: ' + con.Email);
            if(con.Account != null){
                System.debug('Account Name: ' + con.Account.Name);
                System.debug('Account Industry: ' + con.Account.Industry);
               
            }else {
                System.debug('This contact has no account');
            }
        }
    }

}