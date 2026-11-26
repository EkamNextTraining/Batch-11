public class StringMethodsDemo {
    /*
 String Methods - it help us to manipulate and avlidate text without writing complex logic

1.toUpperCase() - converts text into uppercase
2.toLowerCase() - converts text into lowercase
3.length() - returns the numbers of character
4.contains() - checks whether text contains a substring
5.startsWith() - checks the beginning of text [welcome salesforce startsWith(wel)]
6.endsWith() - checks the ending of text
7.trim() - removes leading and trailing white spaces
8.replace() - replaces matching text
9.subString() - extracts part of a code [salesforce substrig(0,5)]
10.indexOf() - finds the first position of a substring [salesforce indexof('force') - 5]
11.equals() - compare the strings ['Hello' equals('Hello') - true]
12.equalsIgnoreCase() - compare the strings but without case sensitivity ['Hello' equalsIgnoreCase('hello') - true ]
13.isEmpty() - checks whether the string is empty
14.isBlank() - checks whether the string is null,empty,whitespaces only
15.split() - splits into a list ['A,B,C' split(',') - ('A','B','C')] 

Integer Methods - perform calculations, compare numbers, convert numeric values into text

1.Math.abs() - return the absoulte value [Math.abs(-24) - 24]
2.Math.max() - returns the larger number [Math.max(10,20) - 20]
3.Math.min() - returns the smaller number [Math.min(12,6) - 6]
4.Integer.valueOf() - converts the string into a integer
5.String.valueOf() - converts the integer into a string
6.+ - add
7.- - subtract
8.* - multiply
9./ - division
10.% - returns the remainder
     */
    public static void demonstrateMethods() {
 
        String internName = '  rahul kumar  ';
 
        String cleanedName = internName.trim();
 
        System.debug('Cleaned Name: ' + cleanedName);
 
        System.debug('Uppercase: ' + cleanedName.toUpperCase());
 
        System.debug('Lowercase: ' + cleanedName.toLowerCase());
 
        System.debug('Name Length: ' + cleanedName.length());
 
        System.debug('Contains Rahul: ' + cleanedName.contains('rahul'));
 
        System.debug('Starts With rahul: ' + cleanedName.startsWith('rahul'));
 
        System.debug('Replace Name: ' + cleanedName.replace('rahul', 'ravi'));
 
        System.debug('First Five Characters: ' + cleanedName.substring(0, 5));
 
        System.debug('Index of kumar: ' + cleanedName.indexOf('kumar'));
 
        System.debug('Case-Insensitive Match: ' + cleanedName.equalsIgnoreCase('RAHUL KUMAR'));
    }
    
    public static void validateEmail(String email){
        if(String.isBlank(email)){
            System.debug('Email cannot be empty');
        }else if(!email.contains('@')){
            System.debug('Invalid email: @ is missing');
        }else {
            System.debug('Basic email check passed');
        }
    }
    
     public static void demonstrateMethodsInt() {
 
        Integer marks1 = 75;
        Integer marks2 = 90;
        Integer difference = marks2 - marks1;
 
        System.debug('Total Marks: ' + (marks1 + marks2));
 
        System.debug('Difference: ' + difference);
 
        System.debug('Highest Marks: ' + Math.max(marks1, marks2));
 
        System.debug('Lowest Marks: ' + Math.min(marks1, marks2));
 
        System.debug('Absolute Value: ' + Math.abs(-25));
 
        Integer convertedNumber = Integer.valueOf('100');
 
        System.debug('Converted Integer: ' + convertedNumber);
 
        String marksText = String.valueOf(marks2);
 
        System.debug('Marks as Text: ' + marksText);
    }

}