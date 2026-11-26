import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
export default class RecordEditForm extends LightningElement {
    @api recordId;
    @api objectApiName;
    handleSuccess(event) {
        this.dispatchEvent(
        new ShowToastEvent({
            title: "Record Updated Successfully",
            message: event.detail.message,
            variant: "success",
        }),
        );
    }
}