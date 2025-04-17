public class AccountContactCalc {
	@future
    public static void countContact(List<Id> accId){
        system.debug('Inside Future');
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN: accId];
        
        for(Account acc: accList)
        {
            acc.Count_of_Contacts__c = acc.Contacts.size();
        }
        if(!accList.isEmpty())
        {
            update accList;
        }
    }
}