import { LightningElement, track, wire} from 'lwc';
import { createRecord } from "lightning/uiRecordApi";
import { getObjectInfo , getPicklistValues } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";

export default class CreateRecord extends LightningElement {
    @track name;
    @track objData;
    @track value = '';
    @track options = [];

    handleChange(event) {
        this.value = event.detail.value;
    }

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    propertyOrFunction({data, error}){
        if(data){
            console.log('dataaa',data);
            this.objData = data;
        }
        if(error){
            console.log('error',error);
        }
    }
    @wire(getPicklistValues, { recordTypeId: "$objData.defaultRecordTypeId", fieldApiName: INDUSTRY_FIELD })
    getPicklistValuesFunction({data,error}){
        if(data){
            this.options = data.values;
            console.log('getPicklistValues dataaa',data);
        }
        if(error){
            console.log('getPicklistValues error',error);
        }
    }


    handleInput(event) {
        this.name = event.target.value;
    }

    async handleCreate() {
        const fields = {};
        // Map the user input to the fields
        fields[NAME_FIELD.fieldApiName] = this.name;
        fields[INDUSTRY_FIELD.fieldApiName] = this.value;

        // Configure your recordInput object with the object and field API names
        const recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields };

        try {
        // Invoke createRecord
        const account = await createRecord(recordInput);
        console.log('account', account);
        } catch (error) {
        
        }
    }
}