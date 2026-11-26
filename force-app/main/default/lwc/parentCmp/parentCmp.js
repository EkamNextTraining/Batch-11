import { LightningElement, track} from 'lwc';

export default class ParentCmp extends LightningElement {
    @track fname;
    @track lname;
    @track email;
    @track phone;


    inputHandler(event){
        if(event.target.name == 'fname'){
            this.fname = event.target.value;
        }
        if(event.target.name == 'lname'){
            this.lname = event.target.value;
        }
        if(event.target.name == 'email'){
            this.email = event.target.value;
        }
    }
    eventHandle(event){
        this.phone = event.detail.phone;
    }
}