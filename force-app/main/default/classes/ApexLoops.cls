//Pascal Case Naming convention 
public class ApexLoops {
    
    //ApexLoops.executeMe();
    /*
    Static Method
	==============
    ClassName.methodName();
    
    Non Static Method
    =================
    ClassName var = new ClassName();
    var.methodName();
	*/
    
	//camel Case Naming convention 
    public static void executeMe(){
        system.debug('hello executeMe');
    }
    public void executeMethod(){
        system.debug('executeMethod');
    }
    
    /*
	Loop :
	=====
	loops are used to execute the logic repeatedly until we meet the condition.

	1. for loop
        for(var initialization;condition;increment){
        	logic
        }	
	 
	2. while loop
		var initialization
        while(condition){
        	logic
			increment
        }
	3. do while loop
		var initialization
        do{
        	logic
			increment
        }while(condition)
	4. soql loop
        for(Account acc : [SELECT Id, Name FROM Account]){
        	system.debug(acc);
        }
	5. nested loop
		for(var initialization;condition;increment){
        	for(var initialization;condition;increment){
                logic
            }	
        }	
	*/
    public static void forLoop(Boolean flag){
        for(Integer i=0;i<=10;i++){
            System.debug(i);//012345678910
        }
        for(Integer i=0;i<=10 && flag ;i++){
            System.debug(i);//012345678910
        }
    }
    public static void whileLoop(){
        Integer i = 10;
        while(i<10){
            System.debug(i);
            //i = i+1;
            i++;//0+1
        }
    }
    public static void doWhileLoop(){
        Integer i = 0;
        do{
            System.debug(i);
            i++;
        }while(i<10);    
    }
    public static void soqlLoop(){
        for(Account acc : [SELECT Id, Name, Rating FROM Account]){
            system.debug(acc.Name+' '+acc.Rating);
        }  
    }
    public static void nestedLoop(){
        for(Integer i=0;i<=10;i++){
            for(Integer j=0;j<=10;j++){
                System.debug('i='+i+' j='+j);
                //i=0 j=0
                //i=0 j=1
                //i=0 j=2,3,4,5,6,7,8,9,10
                //i=1 j=0
                //i=1 j=1
                //i=1 j=2,3,4,5,6,7,8,9,10
            }
        }
    }
    public static void breakStatement(){
        for(Integer i=0;i<=10;i++){
            if(i==5){
                break; 
            }
            system.debug(i);
        }
    }
    public static void continueStatement(){
        for(Integer i=0;i<=10;i++){
            if(i==5){
                continue;
            }
            system.debug(i);
        }
    }
}