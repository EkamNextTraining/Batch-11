import { LightningElement, api} from 'lwc';
export default class ChildLch extends LightningElement {
    @api msg;
    constructor() {
        super();
        console.log('Child Constructor Called');
    }
    connectedCallback() {
        console.log('Child ConnectedCallback Called');
    }
    renderedCallback() {
        console.log('Child RenderedCallback Called');
    }
    disconnectedCallback() {
        console.log('Child DisconnectedCallback Called');
    }
    errorCallback(error, stack) {
        console.log('Child errorCallback Called');
    }
}