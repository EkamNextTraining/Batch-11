public class SOSL {
/*
SOSL - Salesforce Object Search Language - search for text across multiple salesforce objects using a keyword
Syntax - FIND {Search Text} IN SearchGroup RETURNNG ObjectName(Field1, Field2)
FIND - sprcifies the text search
{search text} - keyvalue
IN - specfies which field
RETURNING - searches in that object and fields and return
SEARCH GROUP
ALL FIELDS - it will search in all fields
NAME FIELDS- searches only name fields
EMAIL FIELDS - searches email fields
PHONE FIELDS - searches phone field
SIDEBAR FIELDS - sidebar searches
EX: FIND 'Rahul'RETURNING Account(Id, Name), Contact(Id, First Name, Last Name), Lead(Id, Name)
FINF 'Rahul' IN NAME FIELDS RETURNING Contact(Id, Name LIMIT 10)
 */
    public static void searchAccount(){
        List<List<Sobject>> results = [FIND 'Test' RETURNING Account(Id, Name)];
        System.debug(results);
    }
    
    public static void searchRecords(String searchText) {
 
        if (String.isBlank(searchText)) {
            System.debug('Please enter a search term');
            return;
        }
 
        List<List<SObject>> searchResults = [FIND :searchText RETURNING Account(Id, Name), Contact(Id, FirstName, LastName, Email), Lead(Id, FirstName, LastName, Email)];
 
        List<Account> accountResults = (List<Account>) searchResults[0];
 
        List<Contact> contactResults = (List<Contact>) searchResults[1];
 
        List<Lead> leadResults = (List<Lead>) searchResults[2];
 
        System.debug('Accounts Found: ' + accountResults.size());
 
        for (Account acc : accountResults) {
            System.debug('Account: ' + acc.Name);
        }
 
        System.debug('Contacts Found: ' + contactResults.size());
 
        for (Contact con : contactResults) {
            System.debug('Contact: ' + con.FirstName + ' ' + con.LastName);
        }
 
        System.debug('Leads Found: ' + leadResults.size());
 
        for (Lead leadRecord : leadResults) {
            System.debug('Lead: ' + leadRecord.FirstName + ' ' + leadRecord.LastName);
        }
    }
    
}