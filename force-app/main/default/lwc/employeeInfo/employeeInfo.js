import { LightningElement, api , track} from 'lwc';

export default class EmployeeInfo extends LightningElement {
    @api name;
    @api age;
    @api salary;
    @track show = true;

    nameChange(event){
        this.name = event.target.value;
    }

    ageChange(event){
        this.age = event.target.value;
    }

    salaryChange(event){
        this.salary = event.target.value;
    }

    handleSubmit(){
        this.show = false;
    }
    
}