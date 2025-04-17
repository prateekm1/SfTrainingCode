public with sharing class OppServerController {
	@AuraEnabled
    public static list<Opportunity> getOpp()
    {
        List<Opportunity> oppList =[select Id, Name from opportunity limit 20];
        return oppList;
    }
}