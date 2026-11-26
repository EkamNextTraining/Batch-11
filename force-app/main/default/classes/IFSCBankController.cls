public with sharing class IFSCBankController {

    public String ifscCode { get; set; }
    public BankDetails bank { get; set; }
    public String errorMessage { get; set; }

    public class BankDetails {
        public String BRANCH { get; set; }
        public String CENTRE { get; set; }
        public String DISTRICT { get; set; }
        public String STATE { get; set; }
        public String ADDRESS { get; set; }
        public String CONTACT { get; set; }
        public Boolean IMPS { get; set; }
        public String CITY { get; set; }
        public Boolean UPI { get; set; }
        public String MICR { get; set; }
        public Boolean RTGS { get; set; }
        public Boolean NEFT { get; set; }
        public String SWIFT { get; set; }
        public String ISO3166 { get; set; }
        public String BANK { get; set; }
        public String BANKCODE { get; set; }
        public String IFSC { get; set; }
    }

    public PageReference searchBank() {
        bank = null;
        errorMessage = null;

        if (String.isBlank(ifscCode)) {
            errorMessage = 'Please enter an IFSC code.';
            return null;
        }
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint( 'https://ifsc.razorpay.com/' +EncodingUtil.urlEncode(ifscCode.trim(), 'UTF-8'));
            request.setMethod('GET');
            request.setTimeout(20000);
            HttpResponse response = http.send(request);
            if (response.getStatusCode() == 200) {
                bank = (BankDetails) JSON.deserialize(response.getBody(), BankDetails.class);
            } else {
                errorMessage = 'Bank details not found. Please check the IFSC code.';
            }
        } catch (Exception e) {
            errorMessage = 'Unable to fetch bank details: ' + e.getMessage();
        }
        return null;
    }
}