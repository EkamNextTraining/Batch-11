public class IfExample {
/*
Conditional Statements - allows a program to make decisions based opn the conditions(true/false)
1.If statement - executes a balock of code only when specified condition is true
2.If-else - it chooses between 2 blocks of code 
3.if-else if- contains more than 2 conditions

Switch - when we wamt to execute different blocks of code based on value of a variable
 */
    
    public static void checkDiscount(){
        Decimal discount = 15;
        if(discount >= 10){
            System.debug('Discount approved for review');
        }
    }
    
    public static void checkResult(){
        Integer marks = 35;
        if(marks >= 40){
            System.debug('Student passed');
        }else{
            System.debug('Student failed');
        }
    }
    
    public static void calculateGradea(){
        Integer marks = 85;
        
        if(marks >= 90){
            System.debug('Grade A+');
        }else if(marks >= 75){
            System.debug('Grade A');
        }else if(marks >= 60){
            System.debug('Grade B');
        }else if(marks >= 40){
            System.debug('Grade C');
        } else {
            System.debug('Fail');
        }
            
    }
    
    public static void checkOpportunityStage(){
        String stage = 'Proposal';
        
        switch on stage {
            when 'Prospecting'{
                System.debug('Identify potential customer');
            }
            when 'Qualification'{
                System.debug('understand customer use cases');
            }
            when 'Proposal'{
                System.debug('prepare and send the proposal');
            }
            when else {
                System.debug('unknown oppoetunity');
            }
        }
    }

}