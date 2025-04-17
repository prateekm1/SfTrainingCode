import { LightningElement, api } from 'lwc';

export default class EmployeeDetailChild extends LightningElement {
    @api empDetail ={empName:"John", empAddress:"NY"}
}