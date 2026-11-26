public with sharing class LwcController {
    @AuraEnabled(Cacheable=true)
    public static List<Account> getAccounts(){
        try {
            return [SELECT Id, Name, Rating, Industry FROM Account LIMIT 10];
        } catch (Exception e) {
            return null;
        }
    }

    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContacts(){
        try {
            return [SELECT Id, Name, Email, Phone FROM Contact LIMIT 10];
        } catch (Exception e) {
            return null;
        }
    }
    @AuraEnabled(Cacheable=true)
    public static List<Opportunity> getOpportunities(String searchKey){
        try {
            searchKey = '%'+searchKey+'%';
            return [SELECT Id, Name, Closedate, StageName FROM Opportunity WHERE Name LIKE : searchKey LIMIT 10];
        } catch (Exception e) {
            return null;
        }
    }
    @AuraEnabled
    public static List<Account> createAccount(Account record){
        try {
            insert record;
            return [SELECT Id, Name, Rating, Industry FROM Account WHERE Createddate=TODAY LIMIT 10];
        } catch (Exception e) {
            return null;
        }
    }
}