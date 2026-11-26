/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : ContactController
 * Author          : <YourName>
 * Created Date    : Nov 16, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Nov 16, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Nov 16, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static Contact getSingleContact(String recordId) {
        return [
            SELECT Id, Name, FirstName, LastName, Title, Phone, Email
            FROM Contact WHERE Id=:recordId
            LIMIT 1
        ];
    }
}