import { LightningElement, api} from 'lwc';

export default class ChildCmp extends LightningElement {
    /*
    api : It is used to expose properties and functions to parent lwc. So that we can get data from parent lwc.
    */
    @api firstName;
    @api lastName;
    @api email;
    phone;

    get fullName(){
        return this.firstName+' '+this.lastName;
    }
    inputHandler(event){
        this.phone = event.target.value;
        const myEvent = new CustomEvent('senddata',{detail:{
                "phone":this.phone
            }
        });
        this.dispatchEvent(myEvent);
    }
}