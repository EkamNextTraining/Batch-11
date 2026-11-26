public without sharing class WithOutSharingClass {
    //Ignores record level security. Runs with system admin access
    //User One - 5 records (owns)
    //User Two - 5 records (owns)
    //At the time of execution 
    //User One - 10 records
    //User Two - 10 records
	public static List<Account> getAccounts() {
        return [SELECT Id, Name, Rating, Industry FROM Account];
    }
    public static void callInheritedMethod() {
		//Ignores record level security. Runs with system admin access
        List<Account> accounts = InheritedSharingClass.getAccounts();
		System.debug(accounts);
    }
}