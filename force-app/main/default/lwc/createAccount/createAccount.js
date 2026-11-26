import { LightningElement ,track} from 'lwc';
import createAccount from '@salesforce/apex/LwcController.createAccount';
const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Rating', fieldName: 'Rating'},
    { label: 'Industry', fieldName: 'Industry'}
];
export default class CreateAccount extends LightningElement {
    @track name;
    @track rating;
    @track industry;
    @track accData = [];
    @track columns = columns;
    inputHandler(event) {
        if (event.target.name == 'name') {
            this.name = event.target.value;
        }
        if (event.target.name == 'rating') {
            this.rating = event.target.value;
        }
        if (event.target.name == 'industry') {
            this.industry = event.target.value;
        }
    }
    createData(){
        let record = {"Name":this.name,
                      "Rating":this.rating,
                      "Industry":this.industry
        };
        createAccount({record:record})
        .then(result=>{
            this.accData = result;
            this.name = '';
            this.rating = '';
            this.industry = '';
        })
        .catch(ex=>{

        })
    }
}