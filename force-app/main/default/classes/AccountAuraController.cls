public with sharing class AccountAuraController {

    @AuraEnabled
    public static Id createAccount(String accName,String industry,String phone) {

        Account acc = new Account();
        acc.Name = accName;
        acc.Industry = industry;
        acc.Phone = phone;
        insert acc;
        return acc.Id;
    }
    @AuraEnabled
    public static Account getAccount(Id accId) {
        return [ SELECT Id, Name, Phone, Industry FROM Account WHERE Id = :accId LIMIT 1];
    }
    
    @AuraEnabled
    public static void updateAccount(Account acc) {
        update acc;
    }
    @AuraEnabled
    public static List<Account> getAccounts() {
        return [ SELECT Id, Name, Phone, Industry, Rating FROM Account ORDER BY CreatedDate DESC LIMIT 50];
    }
}