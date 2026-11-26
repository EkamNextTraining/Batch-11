public class DiscountCalculator {
/*
 Test Class - it is written to verify that apex code is working fine or not
@isTest - identifies a test class
@testSetup - creates common test data foe methods
Test.startTest()- starts test
Test.stopTest()- ends the testing
System.assert() - verifiy the condition is true or not
System.assertEquals() - compare the expected value and actual value
System.assertNotEquals()- verifies that two values are different
Test.isRunningTest()-what ever is needed or not
 */
    
    public static Decimal calculateDiscount(Decimal amount, Decimal discountPercent){
        return amount * discountPercent / 100;
    }

}