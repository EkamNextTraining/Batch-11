global class CustomerEmailService
    implements Messaging.InboundEmailHandler {
 
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope envelope) {
 
        Messaging.InboundEmailResult result =new Messaging.InboundEmailResult();
 
        try {
 
            Case newCase = new Case();
 
            newCase.Subject = email.subject;
            newCase.Description = email.plainTextBody;
            newCase.Origin = 'Email';
 
            insert newCase;
 
            result.success = true;
 
        } catch (Exception ex) {
 
            result.success = false;
            result.message = ex.getMessage();
 
        }
 
        return result;
    }
}