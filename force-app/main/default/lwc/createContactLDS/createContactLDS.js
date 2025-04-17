import { LightningElement , api} from 'lwc';

export default class CreateContactLDS extends LightningElement {
    @api recordId;

    createContact(event){
        this.recordId=event.detail.id;
    }
}