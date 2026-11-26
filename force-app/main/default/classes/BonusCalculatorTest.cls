@isTest
public class BonusCalculatorTest {
    @isTest
    static void testBonusCalculation(){
        Decimal salary = 30000;
        Decimal bonus = BonusCalculator.calculateBonus(salary);
        System.assertEquals(Decimal.valueOf('3000'), bonus, 'Bonus should be 10% of salary');
    }

}