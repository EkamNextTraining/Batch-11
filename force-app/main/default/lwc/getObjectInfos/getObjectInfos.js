import { LightningElement, wire} from 'lwc';
import { getObjectInfos } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import OPPORTUNITY_OBJECT from "@salesforce/schema/Opportunity";
import CONTACT_OBJECT from "@salesforce/schema/Contact";

export default class GetObjectInfos extends LightningElement {
    @wire(getObjectInfos, { objectApiNames: [ACCOUNT_OBJECT, OPPORTUNITY_OBJECT,CONTACT_OBJECT]  })
    getObjectInfosFunction({data, error}){
        if(data){
            console.log('getObjectInfos dataaa',data);
        }
        if(error){
            console.log('error',error);
        }
    }
}