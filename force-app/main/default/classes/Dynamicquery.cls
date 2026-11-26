public class Dynamicquery {
/*
Dynamic Query - in this we construct the query as a string and execure it using the database.query()

static soql - List<Account> accounts = [SELECT Id, name FROM Account];
dynamic soql - string test = 'SELECT Id, Name FROM Account';
List<Account> accounts = Database.query(test);
 */
    
    public static void getAccounts(String accountName){
        String query = 'SELECT Id, Name FROM Account ' + 'WHERE Name = :accountName';
        List<Account> accounts = Database.query(query);
        for(Account acc : accounts){
            System.debug('Account Id: ' + acc.Id);
            System.debug('Account Name: ' + acc.Name);
        }
    }

}