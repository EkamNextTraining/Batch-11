public class DataTypesDemo {
    /*
 Apex - it is a strongly typed object oriented language used in salesforce to implement custom business logic
class - defines the structure of our code
varibale- stores a value
method - contains the instructions that perform a task
system.debug - prints a value

Data types - it specifies what kind of value a varibale can store
1.Integer - whole numbers - 22 , 333
2.Decimal - decimal places
3.String - stores text
4.Boolean - true/false
5.Date - current date
6.List - stores multiple values in an order

Variables - it is a named storage location used to hold a value while an apex program executes
1.Local Varibale - declared inside a method and accessable only with in that method
2.Instance Variable - belongs to an object of a class
3.Static Variable - belongs to entire class not to a one object

Assignment Operators - it will assign a value to a variable
1.= belongs to
2.+= - add and assign
3.-= - subtract and assign
4.*= - multiply and assign
5./= = divide and assign
6.i++ - post increment
7.++i - pre increment
8.i-- - post decrement
9.--i - pre decrement

Type Casting - converting a value from one datatype to another datatype
1.Implicit Type Casting - conversion happens automatically
2.Explicit Type Casting - user does the conversion
*/
    public static void showDetails(){
        Integer age = 22;
        Decimal salary = 25000.65;
        String name = 'Rahul';
        Boolean isEmployee = true;
        Date joiningDate = Date.newInstance(2026, 1, 15);
        Datetime currentTime = Datetime.now();
        
        System.debug('Name: ' + name);
        System.debug('Age: ' + age);
        System.debug('Salary: ' + salary);
        System.debug('Employee: ' + isEmployee);
        System.debug('JoiningDate: ' + joiningDate);
        System.debug('CurrentTime: ' + currentTime);
    }
    
    public static void calculateMarks(){
        Integer subject1 = 80;
        Integer subject2 = 90;
        Integer subject3 = 70;
        
        Integer total = subject1 + subject2 + subject3;
        Decimal average = total / 3.0;
        
        System.debug('Total Marks: ' + total);
        System.debug('Average Marks: ' + average);
    }
    
    public static void updateSalary(){
        Integer salary = 30000;
        
        salary = salary + 5000;
        System.debug('Updated Salary: ' + salary);
        
        salary += 2000;
        System.debug('After Bonus: ' + salary);
        
        salary -= 1000;
        System.debug('After Deduction: ' + salary);
        
        salary *= 2;
        System.debug('After Multiplied: ' + salary);
        
        salary /= 2;
        System.debug('Final Salary: ' + salary);
           
        
    }
    
    public static void intergerToDecimal(){
        
        Integer quantity = 10;
        
        Decimal price = quantity;
        
        System.debug('Qunatity: ' + quantity);
        System.debug('Price: ' + price);
            
    }

}