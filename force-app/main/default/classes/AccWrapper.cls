public class AccWrapper {
    public String searchKey{get;set;}
    public List<DataWrapper> dataMap {get;set;}
    
    public AccWrapper(){
        dataMap = new List<DataWrapper>();
    }
    public void fetchData(){
        String searchParam = '%'+searchKey+'%';
        List<Account> accs = [SELECT Id, Name, Rating,Industry, (SELECT Id, LastName FROM Contacts), 
                              (SELECT id,Name, StageName FROM Opportunities) FROM Account WHERE Name LIKE : searchParam];
        List<DataWrapper> data = new List<DataWrapper>();
        for(Account acc : accs){
            DataWrapper datarec = new DataWrapper();
            datarec.acc = acc;
            datarec.cons = acc.contacts;
            datarec.opps = acc.Opportunities;
            datarec.conCount = acc.contacts.size();
            datarec.oppCount = acc.Opportunities.size();
            data.add(datarec);
        }
        dataMap = data;
     }
    public class DataWrapper{
        public Account acc{get;set;}
        public List<Contact> cons{get;set;}
        public List<Opportunity> opps{get;set;}
        public Integer conCount{get;set;}
        public Integer oppCount{get;set;}
    }
}