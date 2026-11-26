import { LightningElement ,track } from 'lwc';
export default class ParentLch extends LightningElement {
    @track message;
    @track showChildLwc = false;
    /*when class instance initilised constructor will be called
    initialise the variable and assign the value
    */
    constructor() {
        super();
        console.log('Parent Constructor Called');
    }
    /*
    It will be called on the insertion of the component into the DOM.
    
    => to fetch data where we call imperative apex methods
    => we can register to events
    => subscribe to LMS
    */
    connectedCallback() {
        console.log('Parent ConnectedCallback Called');
    }
    /*
    It will be called multiple times when a property is updated on the UI.
    
    => to access DOM elements
    => to intilize the third party librarys
    => to apply css dynamically
     */
    renderedCallback() {
        console.log('Parent RenderedCallback Called');
    }
    /*
    When the component is removed at that time this method will be called.

    => to unregister events
    => to clean up data
    => to unscribe lms
     */
    disconnectedCallback() {
        console.log('Parent DisconnectedCallback Called');
    }
    /*
    It will be called when any errors occur in child component.
     */
    errorCallback(error, stack) {
        console.log('Parent errorCallback Called');
    }
    inputHandler(event){
        this.message = event.target.value;
    }
    showChild(){
        this.showChildLwc = true;
    }
    hideChild(){
        this.showChildLwc = false;
    }
}