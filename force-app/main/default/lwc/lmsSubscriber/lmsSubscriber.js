import { LightningElement, wire} from 'lwc';
import { subscribe, unsubscribe, MessageContext } from 'lightning/messageService';
import LWC_MESSAGE_CHANNEL from '@salesforce/messageChannel/lwcMessageChannel__c';
export default class LmsSubscriber extends LightningElement {
    subscription;
    accountName;
    accountPhone;

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        this.subscribeToMessageChannel();
    }
    subscribeToMessageChannel(){
        if(!this.subscription){
            this.subscription = subscribe(this.messageContext,LWC_MESSAGE_CHANNEL, (payload)=> this.handlePayload(payload));
        }
    }
    handlePayload(payload){
        this.accountName = payload.accountName;
        this.accountPhone = payload.accountPhone;
    }
    disconnectedCallback() {
        if(this.subscription){
            unsubscribe(this.subscription);
            this.subscription = null;
        }
    }
}