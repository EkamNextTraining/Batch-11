@isTest
private class DiscountCalculatorTest {
    @isTest
    static void testCalculatorDiscount(){
        Test.startTest();
        Decimal result = DiscountCalculator.calculateDiscount(1000, 10);
        Test.stopTest();
        System.assertEquals(Decimal.valueOf('100'), result,'The Discount should be 100');
    }

}