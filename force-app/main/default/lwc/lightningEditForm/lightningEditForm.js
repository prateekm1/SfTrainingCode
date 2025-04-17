import { LightningElement, api } from 'lwc';
import NAME_FIELFD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';

export default class LightningEditForm extends LightningElement {

    @api recordId;
    @api objectAPIName;

    fields =[NAME_FIELFD,PHONE_FIELD,WEBSITE_FIELD];
}