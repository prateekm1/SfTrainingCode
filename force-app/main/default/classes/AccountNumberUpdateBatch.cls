global class AccountNumberUpdateBatch implements Database.Batchable<sObject>, Database.Stateful {
    
    integer count = 0;
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        String query = 'Select Id, AccountNumber from Account Where AccountNumber =\'XXXX\'';
        return Database.getQueryLocator(query);
    }
	
    global void execute(Database.BatchableContext bc, list<Account> accList)
    {
        for(Account acc: accList)
        {
            acc.AccountNumber = 'AAAA';
            count++;
        }
        update accList;
    }
    global void finish(Database.BatchableContext bc)
    {
        system.debug('Number of records '+count);
    }
}