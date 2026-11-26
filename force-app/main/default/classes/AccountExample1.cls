public class AccountExample1 {
    public static void getAccountNames() {
        List<Account> accList = [
            SELECT Name
            FROM Account
            WHERE Name LIKE 'E%'
        ];

        for (Account acc : accList) {
            System.debug(acc.Name);
        }
    }
}