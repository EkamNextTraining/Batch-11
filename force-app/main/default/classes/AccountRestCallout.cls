public with sharing class AccountRestCallout {


    public static String getAccount(String accountId) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Salesforce/services/apexrest/AccountAPI/' + accountId);
        req.setMethod('GET');
        return sendRequest(req);
    }

    public static String createAccount(Account acc) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Salesforce/services/apexrest/AccountAPI/');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serialize(acc));
        return sendRequest(req);
    }

    public static String updateAccount(Account acc) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Salesforce/services/apexrest/AccountAPI/');
        req.setMethod('PUT');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serialize(acc));
        return sendRequest(req);
    }

    public static String patchAccount(Id accountId,String accountName) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Salesforce/services/apexrest/AccountAPI/');
        req.setMethod('PATCH');
        req.setHeader('Content-Type', 'application/json');
        Map<String, Object> data = new Map<String, Object>{
            'Id' => accountId,
            'Name' => accountName
        };
        req.setBody(JSON.serialize(data));
        return sendRequest(req);
    }

    public static String deleteAccount(String accountId) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(
            'callout:Salesforce/services/apexrest/AccountAPI/' + accountId
        );
        req.setMethod('DELETE');
        return sendRequest(req);
    }

   
    private static String sendRequest(HttpRequest req) {
        Http http = new Http();
        HttpResponse res = http.send(req);
        System.debug('req' + req);
        System.debug('Status Code: ' + res.getStatusCode());
        System.debug('Response: ' + res.getBody());
        if (res.getStatusCode() >= 200 && res.getStatusCode() < 300) {
            return res.getBody();
        } else {
            throw new CalloutException('API Error: ' + res.getStatusCode() + ' - ' + res.getBody());
        }
    }
}