public class AccountListController {
    public List<Account> accList {get;set;}
    public AccountListController(){
        accList = [SELECT id, Name, rating, industry, Type FROM Account LIMIT 30];
    }
}