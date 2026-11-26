import { LightningElement, wire} from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import LWC_MESSAGE_CHANNEL from '@salesforce/messageChannel/lwcMessageChannel__c';
export default class LmsPublisher extends LightningElement {

    accountName;
    accountPhone;

    handleChange(event) {
        this.accountName = event.target.value;
    }
    handlePhoneChange(event) {
        this.accountPhone = event.target.value;
    }


    @wire(MessageContext)
    messageContext;

    handlePublish() {
        const payload = { "accountName": this.accountName,
                          "accountPhone": this.accountPhone};
        publish(this.messageContext, LWC_MESSAGE_CHANNEL, payload);
    }

}