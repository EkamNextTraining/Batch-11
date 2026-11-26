import { LightningElement , wire} from 'lwc';
import { fireEvent } from 'c/pubsub';
import { subscribe, unsubscribe, MessageContext } from 'lightning/messageService';
import LWC_MESSAGE_CHANNEL from '@salesforce/messageChannel/lwcMessageChannel__c';
export default class PubsubPublisher extends LightningElement {

    subscription;
    accountName;
    accountPhone;

    handleChange(event) {
        this.accountName = event.target.value;
    }
    handlePhoneChange(event) {
        this.accountPhone = event.target.value;
    }

    handlePublish() {
        fireEvent('accountEvent', {
            accountName: this.accountName,
            accountPhone:this.accountPhone
        });
    }





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