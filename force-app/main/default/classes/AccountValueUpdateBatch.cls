global class AccountValueUpdateBatch implements Database.Batchable<sObject> {
   
    global Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('Inside Start');
        String query = 'SELECT Id, AccountNumber, BillingCity, BillingState, BillingCountry, BillingAddress FROM Account where AccountNumber =null or BillingCity =null or BillingState =null or BillingCountry = null';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<Account> accList)
    {
        system.debug('Inside execute');
        for(Account acc: accList)
        {
            if(acc.AccountNumber == null)
                acc.AccountNumber = 'XXXX';
            if(acc.BillingCity == null)
                acc.BillingCity = 'Banglore';
            if(acc.BillingState == null)
                acc.BillingState = 'Karnataka';
            if(acc.BillingCountry == null)
                acc.BillingCountry = 'India';
        }
        update accList;
    }
    global void finish(Database.BatchableContext bc)
    {
        system.debug('Inside finish');
    }
    
}