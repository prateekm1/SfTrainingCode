import { LightningElement} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import  NAME_FIELD from '@salesforce/schema/Account.Name';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import SITE_FIELD from '@salesforce/schema/Account.Site';

export default class CreateRecord extends LightningElement {

    accountObject = ACCOUNT_OBJECT;
    nameField = NAME_FIELD;
    websiteField = WEBSITE_FIELD;
    phoneField = PHONE_FIELD;
    siteField = SITE_FIELD;

    handleAccountCreate(event){
        this.dispatchEvent(
            new ShowToastEvent({
                title:"Record is Saved",
                message:event.detail.message,
                variant:"Success"
            }),
        );
    }
}