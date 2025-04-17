import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement {
    handleChange(event){
        this.template.querySelector('c-child-comp').changeMessage(event.target.value);
    }
}