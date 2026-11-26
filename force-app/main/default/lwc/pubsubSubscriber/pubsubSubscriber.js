import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import {registerListener,unregisterListener } from 'c/pubsub';

import { subscribe, unsubscribe, MessageContext } from 'lightning/messageService';
import LWC_MESSAGE_CHANNEL from '@salesforce/messageChannel/lwcMessageChannel__c';

export default class AccountSubscriber extends LightningElement {
    subscription;
    accountName;
    accountPhone;

    @wire(CurrentPageReference)
    pageRef;

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        registerListener('accountEvent',this.handleAccountEvent,this);
        this.subscribeToMessageChannel();
    }

    handleAccountEvent(payload) {
        this.accountName = payload.accountName;
        this.accountPhone = payload.accountPhone;
    }

    disconnectedCallback() {
        unregisterListener('accountEvent', this.handleAccountEvent,this);
        if(this.subscription){
            unsubscribe(this.subscription);
            this.subscription = null;
        }
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
}