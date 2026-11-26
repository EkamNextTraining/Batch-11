public class IFSCCallout {
	public static String getCalloutResponseContents(String ifscCode) {

    // Instantiate a new Http object
    Http h = new Http();
     // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint('callout:IFSC/'+ifscCode);
    req.setMethod('GET');

    // Send the request, and return a response
    HttpResponse res = h.send(req);
    system.debug(res);
    system.debug(res.getBody());
    return res.getBody();
  }
    public static String dogImage() {

    // Instantiate a new Http object
    Http h = new Http();
     // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://dog.ceo/api/breeds/image/random');
    req.setMethod('GET');

    // Send the request, and return a response
    HttpResponse res = h.send(req);
    system.debug(res);
    system.debug(res.getBody());
    return res.getBody();
  }
    public static String spoonacularApi(String searchItem) {
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://api.spoonacular.com/food/ingredients/search?query='+searchItem+'&apiKey=6c56e3e1d61d49ee9427a0d6ff68b1e2');
    req.setMethod('GET');
    HttpResponse res = h.send(req);
    system.debug(res);
    system.debug(res.getBody());
    return res.getBody();
  }
}