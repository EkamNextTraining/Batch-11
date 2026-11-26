import { LightningElement , api } from 'lwc';
export default class EditForm extends LightningElement {
    @api recordId;
    @api objectApiName;
}