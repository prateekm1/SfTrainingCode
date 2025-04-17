global class ContactAddressUpdateBatch implements Database.Batchable<sObject>{
    
    integer count = 0;
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        system.debug('Inside Start');
        
        string query = 'SELECT Id, AccountId, mailingCity, mailingState, mailingCountry FROM Contact';
        
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> conList)
    {
        Map<Id, Contact> conMap = new Map<Id, Contact>();
        set<id> accId = new set<id>();
       
        for(Contact con: conList)
        {
            if(con.AccountId != null)
            {
                accId.add(con.AccountId);
            }
        }
        Map<Id,Account> accMap = new map<id, Account>([Select Id, billingCountry, billingState, billingCity FROM Account where Id in: accId]);
        
        for(Contact Con: conList)
        {
            if(accMap.ContainsKey(con.AccountId)){
            if(con.MailingCity == null &&  accMap.get(con.accountId).billingCity!= null )
                con.MailingCity = accMap.get(con.accountId).billingCity;
            if(con.MailingState == null && accMap.get(con.accountId).billingState != null)
                con.MailingState = accMap.get(con.accountId).billingState;
            if(con.MailingCountry == null && accMap.get(con.accountId).billingCountry != null)
                con.MailingCountry =  accMap.get(con.accountId).billingCountry;
       		 }
            }
        update conList;
        
    }
    global void finish(Database.BatchableContext bc)
    {
        system.debug('Number of records '+count);
    }
    
}