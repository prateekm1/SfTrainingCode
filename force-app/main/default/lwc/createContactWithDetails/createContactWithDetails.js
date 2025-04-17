import { LightningElement,track, wire } from 'lwc';
import {createRecord, getRecord} from "lightning/uiRecordApi";
const fieldArray=['Contact.LastName','Contact.Email','Contact.Phone'];

export default class CreateContactLDS extends LightningElement {
    @track contactName;
    @track contactPhone;
    @track contactEmail;
    
    @track recordId;
    @wire(getRecord,{recordId:'$recordId',fields:fieldArray}) contactRecord;
    handleNameChange(event)
    {
        this.contactName=event.target.value;
    }

    handlePhoneChange(event)
    {
        this.contactPhone=event.target.value;
    }
    handleEmailChange(event)
    {
        this.contactEmail=event.target.value;
    }
    createContact()
    {
        const fields={'LastName':this.contactName,'Phone':this.contactPhone,'Email':this.contactEmail};
        const recordInput={apiName:'Contact',fields};
        createRecord(recordInput).then(response=>{
            console.log('Contact has been created successfully ',response.id);
            this.recordId=response.id;
        }).catch(error=>{
            console.log('Error in creating contact: ',error.body.message);
        });
    }

    get retContactName(){
        if(this.contactRecord.data){
            return this.contactRecord.data.fields.LastName.value;
        }
        return 'undefined';
    }
    get retContactPhone(){
        if(this.contactRecord.data){
            return this.contactRecord.data.fields.Phone.value;
        }
        return undefined;
    }
    get retContactEmail(){
        if(this.contactRecord.data){
            return this.contactRecord.data.fields.Email.value;
        }
        return undefined;
    }
}