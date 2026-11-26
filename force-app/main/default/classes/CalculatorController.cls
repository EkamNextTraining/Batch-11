public class CalculatorController {
    public Decimal num1 {get;set;}
    public Decimal num2 {get;set;}
    public Decimal result {get;set;}
    public void addition(){
        result = num1+num2;
    }
    public void substraction(){
        result = num1-num2;
    }
    public void multiplication(){
        result = num1*num2;
    }
    public void division(){
        result = num1/num2;
    }
}