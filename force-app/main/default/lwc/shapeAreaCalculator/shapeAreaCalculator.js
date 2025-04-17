import { LightningElement, api } from 'lwc';

export default class ShapeAreaCalculator extends LightningElement {
    @api output;
    width;
    length;
    side;
    digonal1;
    diagonal2;

    sideChangeHandler(event){
        this.side = event.target.value;
    }
    lengthChangeHandler(event){
        this.length = event.target.value;
    }
    widthChangeHandler(event){
        this.width = event.target.value;
    }

    digonal1ChangeHandler(event){
        this.digonal1 = event.target.value;
    }
    diagonal2ChangeHandler(event){
        this.diagonal2 = event.target.value;
    }   

    calculateSquare(){
        const s = parseInt(this.side);
        this.output = 'Area of Square = ' + s*s;
    }
    calculateRectangle(){
        const l= parseInt(this.length);
        const w = parseInt(this.width);
        this.output = 'Area of Rectangle = ' + l*w;
    }
    calculateRhombus(){
        const d1 = parseInt(this.digonal1);
        const d2 = parseInt(this.diagonal2);
        this.output = 'Area of Rhombus = ' + (d1*d2)/2;
    }
}