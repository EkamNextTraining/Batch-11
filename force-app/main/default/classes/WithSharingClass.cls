public with sharing class WithSharingClass {
    //It enforces the record level security - OWD, Sharing Rules, Role Hierarchy, Manual Sharing
    //User One - 5 records (owns)
    //User Two - 5 records (owns)
    //At the time of execution 
    //User One - 5 records (owns)
    //User Two - 5 records (owns)
	public static List<Account> getAccounts() {
        return [SELECT Id, Name, Rating, Industry FROM Account];
    }
    public static void callInheritedMethod() {
        //It enforces the record level security
        List<Account> accounts = InheritedSharingClass.getAccounts();
		System.debug(accounts);
    }
    //PMD - Programmatic Mistake Detector
    public static List<Account> getAccountsData() {
		return [SELECT Id, Name, Rating, Industry FROM Account WITH USER_MODE];
    }
    public static List<Account> getAccountsData1() {
		List<Account> accounts = [SELECT Id, Name, Rating, Industry FROM Account];
        SObjectAccessDecision decision = Security.stripInaccessible(AccessType.READABLE,accounts);
		List<Account> accessibleAccounts = (List<Account>)decision.getRecords();
		System.debug(accessibleAccounts);
        return accessibleAccounts;
    }
    //apex method should not have more than five parameters
    //do not multiple if conditions
}