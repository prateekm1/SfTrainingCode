import { LightningElement, api } from 'lwc';
import getAllOpps from '@salesforce/apex/OppManager.getOpp';

export default class FetchOppViaApex extends LightningElement {

    @api numberOfRecords;
    @api opps;

    get responseRecived(){
        if(this.opps){
            return true;
        }
        return false;
    }
    numberChange(event){
        this.numberOfRecords= event.target.value;
    }
    handleClick(){
        getAllOpps({count:this.numberOfRecords}).then(response=>{
            this.opps = response;
        }).catch(error=>{
            console.log('Error in getting Opp: ',error.body.message);
        });
    }
}