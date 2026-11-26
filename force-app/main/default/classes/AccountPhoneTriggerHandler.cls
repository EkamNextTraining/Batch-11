public class AccountPhoneTriggerHandler {
 
    private static Set<Id> processedAccountIds = new Set<Id>();
 
    public static void handleAfterUpdate(List<Account> newAccounts, Map<Id, Account> oldMap) {
 
        List<Account> accountsToUpdate = new List<Account>();
 
        for (Account acc : newAccounts) {
 
            Account oldAccount = oldMap.get(acc.Id);
 
            if (acc.Phone != oldAccount.Phone && !processedAccountIds.contains(acc.Id)) {
 
                processedAccountIds.add(acc.Id);
 
                Integer currentCount = acc.Phone_Update_Count__c == null ? 0 : acc.Phone_Update_Count__c.intValue();
 
                accountsToUpdate.add(new Account(Id = acc.Id, Phone_Update_Count__c = currentCount + 1));
            }
        }
 
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}