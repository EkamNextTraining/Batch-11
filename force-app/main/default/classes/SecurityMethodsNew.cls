public class SecurityMethodsNew {
	public static List<Account> getAccounts() {
        List<Account> accounts = [SELECT Id, Name, Rating, Industry FROM Account];
        SObjectAccessDecision decision = Security.stripInaccessible(AccessType.READABLE,accounts);
		List<Account> accessibleAccounts =	(List<Account>)decision.getRecords();
		System.debug(accessibleAccounts);
        return accessibleAccounts;
    }
    public static void createAccounts() {
        Account acc = new Account();
        acc.Name = 'test record';
        acc.AnnualRevenue = 1000000;
		List<Account> accounts = new List<Account>{acc};
		SObjectAccessDecision decision = Security.stripInaccessible(AccessType.CREATABLE,accounts);
		insert decision.getRecords();
    }
    public static void updateAccounts() {
        List<Account> accounts = [SELECT Id, Name, Rating, Industry FROM Account LIMIT 5];
		for(Account a : accounts){
			a.AnnualRevenue += 1000;
		}
		SObjectAccessDecision decision = Security.stripInaccessible(AccessType.UPDATABLE,accounts);
		update decision.getRecords();
    }
    public static void upsertAccounts() {
        List<Account> accounts = [SELECT Id, Name, Rating, Industry FROM Account LIMIT 5];
		for(Account a : accounts){
			a.AnnualRevenue += 1000;
		}
		SObjectAccessDecision decision = Security.stripInaccessible(AccessType.UPSERTABLE,accounts);
		upsert decision.getRecords();
    }
}