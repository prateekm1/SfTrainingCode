import { LightningElement, api } from 'lwc';

export default class SimpleInterestCalc extends LightningElement {
    @api output;
    principal;
    time;
    rate;

    principalHandler(event) {
        this.principal = parseInt(event.target.value);
    }

    timeHandler(event) {
        this.time = parseInt(event.target.value);
    }   

    rateHandler(event) {
        this.rate = parseInt(event.target.value);
    }       
    calculate(){
        this.output = `Simple Interest = `+(this.principal*this.rate*this.time)/100;
    }
}