import { LightningElement, api, track, wire } from 'lwc';

export default class StudentForm extends LightningElement {
    /*
    Decorators : We use these decorators for properties and functions.

    api - It is used for data communication from parent to Child lwc components

    track - It is used to track the changes in array, object, boolean variables.

    wire - It is used to read the salesforce data.
    */
    @track fname;
    @track lname;
    @track age;
    @track city;
    @track phone;
    @track email;
    @track fullName;
    @track showData = false;
    fnameHandler(event){
        this.fname = event.target.value;
        console.log(this.fname);
    }
    lnameHandler(event){
        this.lname = event.target.value;
        console.log(this.lname);
    }
    ageHandler(event){
        this.age = event.target.value;
        console.log(this.age);
    }
    cityHandler(event){
        this.city = event.target.value;
        console.log(this.city);
    }
    phoneHandler(event){
        this.phone = event.target.value;
        console.log(this.phone);
    }
    emailHandler(event){
        this.email = event.target.value;
        console.log(this.email);
    }
    displayData(){
        var fullName = this.fname +' '+this.lname;
        this.fullName = fullName;
        this.showData = true;
    }
    clearData(){
        this.fname = '';
        this.lname = '';
        this.age = '';
        this.city = '';
        this.phone = '';
        this.email = '';
        this.showData = false;
    }

    //var, let, const
    /*
    var:
    =====
    function scoped
    It can be reclared and reassigned.

    var name = 'Kushal';
    name = 'Lokesh';
    var name = 'Tarun';

    let:
    =====
    It is a block scoped.
    can be reassigned.

    let name = 'Kushal';
    name = 'Lokesh';
    let name = 'Tarun'; (not works)

    const:
    ======
    It is a block scoped.
    It cannot be reclared and reassigned.

    const name = 'Kushal';
    name = 'Lokesh'; (not works)
    */
}