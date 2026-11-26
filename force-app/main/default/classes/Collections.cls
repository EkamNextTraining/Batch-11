public with sharing class Collections {
    /* 
    Collections : Collections are used to multiple values.

    String name = 'Kushal';

    List
    ====
    List is used to store same data type values and follows the indexing order

    Set
    =====
    Set is used to store same data type values without duplicate values.
    the values are stored in a order

    Map
    ====
    Map stores the values in key and value pair
    key must be unique and value can be duplicate of same data types


    */
    public static void listCollections(){
        //syntax
        List<String> names = new List<String>();
        names.add('Kushal');
        names.add('Lokesh');
        names.add('Tarun');
        system.debug(names);
        system.debug(names.size());
        List<String> namesList = new List<String>{'Laukik','Ayush','Anil'};
        system.debug(namesList);
        namesList.sort();
        system.debug(namesList);
        namesList.addAll(names);
        system.debug(namesList);
        system.debug(namesList.get(3));
        namesList.clear();
        system.debug(namesList);
    }
    public static void setCollections(){
        //syntax
        Set<String> names = new Set<String>();
        names.add('Kushal');
        names.add('Lokesh');
        names.add('Tarun');
        system.debug(names);
        system.debug(names.size());
        Set<String> namesList = new Set<String>{'Laukik','Ayush','Anil'};
        system.debug(namesList);
        namesList.addAll(names);
        system.debug(namesList);
        namesList.clear();
        system.debug(namesList);
    }
    public static void mapCollections(){
        //syntax
        Map<Integer, String> studentsMap = new Map<Integer, String>();
        studentsMap.put(1,'Kushal');
        studentsMap.put(5,'Lokesh');
        studentsMap.put(3,'Tarun');
        studentsMap.put(4,'Ayush');
        studentsMap.put(2,'Ayush');
        system.debug(studentsMap);
        Map<Integer, String> studentsMap2 = new Map<Integer, String>{1=>'Kelvin',2=>'Lem Buise'};
        system.debug(studentsMap2);
        system.debug(studentsMap.keySet());//List<Integer>
        system.debug(studentsMap.Values());//List<String>
        system.debug(studentsMap.containskey(4));
        system.debug(studentsMap.get(5));

        for(Integer i : studentsMap.keySet()){
            system.debug(i);
            if(i==4){

            }
        }
    }
}