import { LightningElement, track } from 'lwc';

export default class ParentComp2 extends LightningElement {
   @track message;
   constructor(){
    super();
    this.template.addEventListener('myCustomEvent',this.handleEvent.bind(this));
   }
    handleEvent(event){
        this.message = event.detail;
    }
}