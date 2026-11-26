import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    //Global Variables
    name = 'Kushal Parakala'; //string
    age = 19; //Integeger
    city = 'Hyderabad'; //string
    phoneNumbers = ['9876543210','7896543210']; // array
    education = {'course':'B.Tech','year':'2024'}; //object
    isStudent = true; //boolean
    companyName = undefined;

    printData(){
        console.log(this.name);
        console.log(this.age);
        console.log(this.city);
        console.log(this.phoneNumbers);
        console.log(this.education);
        console.log(this.isStudent);
        console.log(this.companyName);
    }
}