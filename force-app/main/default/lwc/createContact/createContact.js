import { LightningElement, api } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

export default class CreateContact extends LightningElement {
    @api firstname;
    @api lastname;
    @api email;
    @api phone;

    handleFirstNameChange(event){
        this.firstname = event.target.value;
    }
    handleLastNameChange(event){
        this.lastname = event.target.value;
    }
    handleEmailChange(event){
        this.email = event.target.value;
    }
    handlePhoneChange(event){
        this.phone = event.target.value;
    }

    handleCreateContact(){
        const fields ={'FirstName':this.firstname, 'LastName':this.lastname, 'Email':this.email, 'Phone':this.phone};
        const recordInput = {apiName:'Contact', fields};
        createRecord(recordInput).then(response=>{
            console.log('Record created '+response.id);
        }).catch(error=>{
            console.log('Error occured '+error.body.message);
        })
    }
}