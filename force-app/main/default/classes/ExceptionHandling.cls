public class ExceptionHandling {
/*
Exception Handling - it allows developers to detect errors, respond appropriately and prevent failure
try- contains code that may throw error
catch - handles the error
finally - runs after try/catch processing whether error is present or not gives output
throw -throw an error
 */
    public static void getAccount(Id accountId){
        try{
            Account acc = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
            System.debug('Account Name: ' + acc.Name);
            
        }Catch (QueryException e){
            System.debug('Query Failed: ' + e.getMessage());
        }finally {
            System.debug('Account correct');
        }
    }

}