import { LightningElement } from 'lwc';

export default class EmployeeDetailParent extends LightningElement {
    empDetails=[
    {
        empName:"John",
        empAddress:"New York"
    },
    {
        empName:"Mike",
        empAddress:"California"
    },
    {
        empName:"Jane",
        empAddress:"New York"
    },
    {
        empName:"Jack",
        empAddress:"California"
    }];
}