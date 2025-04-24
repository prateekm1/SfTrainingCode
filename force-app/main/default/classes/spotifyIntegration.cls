public with sharing class spotifyIntegration {
    
    @AuraEnabled
    public static string searchWithSpotify(string trackName){
        Http http = new Http();

        HttpRequest request = new HttpRequest();
        
        request.setMethod('GET');

        string encodedName = EncodingUtil.urlEncode(trackName, 'UTF-8');

        //--url 'https://api.spotify.com/v1/search?q=remaster%2520track%3ADoxy%2520artist%3AMiles%2520Davis&type=track&limit=1&offset=1' 

        request.setEndpoint('callout:Spotify/v1/search?q='+encodedName+'&type=track&limit=1&offset=1');

        try{
            HttpResponse response = http.send(request);
            System.debug('response '+response.getBody());
            System.debug('response status code '+response.getStatusCode());
            System.debug('response status '+response.getStatus());
            
            if(response.getStatus()=='OK'){
                return response.getBody();
            }else{
                throw new  AuraHandledException('exceptionText '+response.getBody());
            }
           
        }catch(Exception e){
            system.debug('Error: ' + e.getMessage());
            throw new  AuraHandledException('exceptionText '+e.getMessage());
        }
       
    }
}