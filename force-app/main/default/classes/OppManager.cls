public with sharing class OppManager {
    
    @AuraEnabled(cacheable=true)
    public static list<Opportunity> getOpp(integer count){
        integer lim = count;
        return [select id,Name,stageName from Opportunity limit :lim];
    }
}