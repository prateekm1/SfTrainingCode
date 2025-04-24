import { LightningElement } from 'lwc';
import searchWithSpotify from '@salesforce/apex/spotifyIntegration.searchWithSpotify';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class SearchSpotify extends LightningElement {
    
    searchTrack;
    displayResult = false;
    trackData = '';
    trackUrl = '';
    changeHandler(event){
        this.searchTrack = event.target.value;
        console.log("track: ", this.searchTrack);
    }

    async searchTracks(){
        let isValid = this.validateInput();
        if(isValid){
            try{
                let responseString = await searchWithSpotify({trackName: this.searchTrack});
                let response = JSON.parse(responseString);
                this.displayResult = true;
                this.trackData = response.tracks.items[0];
                this.trackUrl = this.trackData.album.images[0].url;

                console.log("track URL ",this.trackUrl);
                console.log(response);
                console.log('Parsed data:', JSON.stringify(response, null, 2));
                console.log('Href:', response.tracks.href);

            }catch(error){
                console.log(error);
                this.showToast('Error', error.message, 'error');
            }
        }
    }

    validateInput(){
        let isValid = true;
        let element = this.template.querySelector('lightning-input');
        if(!element.checkValidity()){
            element.reportValidity();
            isValid = false;
        }
        console.log('input is valid');
        return isValid;
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message:message,
            variant: variant,
        });
        this.dispatchEvent(event);
    }

    get artistName(){
       let artistNameArr = this.trackData.artists.map(currItem => currItem.name);
       let artistNameString = artistNameArr.join(", ");
       return artistNameString;
    }
}