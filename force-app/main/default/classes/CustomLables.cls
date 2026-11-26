public class CustomLables {
/*
Custom Label - text values in apex, resuable, we can use this on flows,apex,validation rules
Custom Settings - stores configuration
1.list custom settings- stores multiple configuration records
2.Hierarchy custom settings - based on organistaion level, profile level, user level
 */
    
    public static void createAccount(){
        Account acc = new Account();
        acc.Name = 'Tech Custom';
        insert acc;
        String successMessage = System.Label.Custom_Label;
        System.debug(successMessage);
    }
    public static Decimal getMaximumDiscount(){
        Sales_Configuration__c config = Sales_Configuration__c.getInstance();
        if(config == null || config.Maximum_Discount__c == null){
            return 20;
        }
        return config.Maximum_Discount__c;
    }
    public static Boolean isDiscountAllowed(Decimal requestedDiscount){
        Decimal maximumDiscount = getMaximumDiscount();
        if(requestedDiscount == null || requestedDiscount < 0){
            return false;
        }
        return requestedDiscount <= maximumDiscount;
    }

}