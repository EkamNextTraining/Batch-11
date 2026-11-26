import { LightningElement, wire, track } from 'lwc';
import { getObjectInfo , getPicklistValues , getPicklistValuesByRecordType } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
export default class GetObjectInfo extends LightningElement {
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

    @wire(getPicklistValuesByRecordType, {objectApiName: ACCOUNT_OBJECT, recordTypeId: "$objData.defaultRecordTypeId"})
    getPicklistValuesByRecordTypeFunction({data,error}){
        if(data){
            console.log('getPicklistValuesByRecordType dataaa',data);
        }
        if(error){
            console.log('getPicklistValues error',error);
        }
    }
}