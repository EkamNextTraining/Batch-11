public class SecurityMethods {
	public static List<Account> getAccounts() {
        List<Account> accounts;
        if(Account.SObjectType.getDescribe().isAccessible()){
            accounts = [SELECT Id, Name, Rating, Industry FROM Account];
        }
        return accounts;
    }
    public static void createAccount() {
        if(Account.SObjectType.getDescribe().isCreateable()){
            insert new Account(Name='test record');
        }
    }
    public static void updateAccount() {
        if(Account.SObjectType.getDescribe().isUpdateable()){
			Account acc = [SELECT Id, Name, Rating, Industry FROM Account LIMIT 1];
			acc.Name = 'Updated';
            update acc;
        }
    }
    public static void deleteAccount() {
        if(Account.SObjectType.getDescribe().isDeletable()){
			Account acc = [SELECT Id, Name, Rating, Industry FROM Account LIMIT 1];
            delete acc;
        }
    }
    public static void checkFieldAccess() {
        if(Account.Name.getDescribe().isAccessible()){
            System.debug('User can read Name field');
            Account acc = [SELECT Id, Name, Rating, Industry FROM Account LIMIT 1];
        }
    }
    public static void checkFieldCreatable() {
        if(Account.AnnualRevenue.getDescribe().isCreateable()){
			System.debug('User can create AnnualRevenue');
		}
    }
    public static void checkFieldUpdatable() {
        if(Account.AnnualRevenue.getDescribe().isUpdateable()){
			System.debug('User can update AnnualRevenue');
		}
    }
}