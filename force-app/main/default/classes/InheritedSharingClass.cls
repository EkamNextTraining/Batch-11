public inherited sharing class InheritedSharingClass {

    public static List<Account> getAccounts() {
		return [SELECT Id, Name, Rating, Industry FROM Account];
    }
}