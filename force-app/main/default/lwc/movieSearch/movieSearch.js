import { LightningElement } from 'lwc';
const Delay = 300;

export default class MovieSearch extends LightningElement {
    selectedType="";
    selectedSearch="";
    loading=false;
    selectedPageNo ="1";
    delayTimeout;
    searchResult =[];
    selectedMovie="";

    //combobox
    get typeOptions() {
        return [
            { label: 'None', value: '' },
            { label: 'Movie', value: 'movie' },
            { label: 'Series', value: 'series' },
            { label: 'Episode', value: 'episode' },
        ];
    }

    handleChange(event){
        let {name, value} = event.target;
        this.loading = true;
        if(name==="type"){
            this.selectedType = value;
        }
        else if(name==="search"){
            this.selectedSearch = value;
        }
        else if(name==="pageno"){
            this.selectedPageNo = value;
        }
        // debouning
        clearTimeout(this.delayTimeout);
        this.delayTimeout = setTimeout(() => {
            this.searchMovie()
        }, Delay);
    }

    //method to search entered movie name 
    async searchMovie(){
        const URL = `http://www.omdbapi.com/?apikey=be869937&s=${this.selectedSearch}&type=${this.selectedType}&page=${this.selectedPageNo}`;
        const res = await fetch(URL);
        const data = await res.json();
        console.log("Movie search output ", data);
        this.loading = false;
        if(data.Response === 'True'){
            this.searchResult = data.Search;
        }
    }

    get displaySearchResult(){
        return this.searchResult.length > 0 ? true : false;
    }

    movieSelectedHandler(event){
        this.selectedMovie = event.detail;
    }
}