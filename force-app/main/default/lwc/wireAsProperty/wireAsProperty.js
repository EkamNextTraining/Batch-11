import { LightningElement, wire, track} from 'lwc';
import getAccounts from '@salesforce/apex/LwcController.getAccounts';
import getContacts from '@salesforce/apex/LwcController.getContacts';
import getOpportunities from '@salesforce/apex/LwcController.getOpportunities';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import { deleteRecord } from 'lightning/uiRecordApi';
const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' }
];

const oppColumns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Stage Name', fieldName: 'StageName'},
    { label: 'Close Date', fieldName: 'Closedate', type: 'date' }
];

export default class WireAsProperty extends LightningElement {
    /*
    Wire : It is used to read the salesforce data. 
    It retrieves the data from apex and also it retrieves data from lwc modules.

    Wire as property
    Wire as a function
    Wire as a reactive service - It is used to fetch latest data from server.
    */
    @track columns = columns;
    @track contactRecords = [];
    @track oppColumns = oppColumns;
    @track oppRecords = [];
    @track userInput;

    inputHandler(event){
        this.userInput = event.target.value;
    }

    @wire(getAccounts)
    accounts;

    @wire(getContacts)
    contactsData({data, error}){
        if(data){
            this.contactRecords = data;
            console.log('@dataaaa',data);
        } else if(error){
            this.contactRecords = [];
            console.log('@error',error);
        }
    }

    @wire(getOpportunities,{searchKey:'$userInput'})
    oppsData({data, error}){
        if(data){
            this.oppRecords = data;
            console.log('@oppRecords',data);
        } else if(error){
            this.contactRecords = [];
            console.log('@error',error);
        }
    
    }
    async deleteRecord(event) {
        const recordId = event.target.dataset.recordid;

        try {
            await deleteRecord(recordId);
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Account deleted',
                    variant: 'success'
                })
            );
            //await refreshApex(this.wiredAccountsResult);
        } catch (error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error deleting record',
                    message: reduceErrors(error).join(', '),
                    variant: 'error'
                })
            );
        }
    }
}