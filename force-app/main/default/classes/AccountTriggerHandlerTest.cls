@isTest
public class AccountTriggerHandlerTest {
    
    @testSetup
    static void createAccountData()
    {
        List<Account> accList = new List<Account>();
        set<Id> accId = new set<Id>();
        for(Integer i=0;i<10;i++)
        {
            Account acc = new Account();
            acc.Name = 'Test Setup '+i;
            accList.add(acc);
            accId.add(acc.Id);
        }
        insert accList;
        
    }
    
    @isTest
    static void testCreateOpp()
    {
        
       /* set<Id> accId = new set<Id>();
        for(Integer i=0;i<10;i++)
        {
            Account acc = new Account();
            acc.Name = 'Test '+i;
            accList.add(acc);
            accId.add(acc.Id);
        } */
        
        //using DataFactory class
       // DataFactory.createAccount('Test ',10, true); //when inserting
        DataFactory.createAccount('Test ',10, false); 
        
        List<Account> accList = new List<Account>();
        for(Account acc: accList)
        {
            acc.Active__c ='Yes';
        }
        insert accList;
        
        Test.startTest();
        insert accList;
        Test.stopTest();
    }
    
    @isTest
    static void testUpdateRatingInsert()
    {
        List<Account> accList = new List<Account>();
        set<Id> accId = new set<Id>();
        for(Integer i=0;i<10;i++)
        {
            Account acc = new Account();
            acc.Name = 'Test '+i;
            accList.add(acc);
            accId.add(acc.Id);
        }
        Test.startTest();
        insert accList;
        for(Account acc: accList)
        {
            acc.Industry='Media';
        }
        update accList;
        Test.stopTest();
        
        List<Account> accRes = [Select id, Rating,Description from Account where id =: accList.get(0).id];
        System.assertEquals('Hot', accRes.get(0).Rating,'Rating is Hot');
        
    }
   
    @isTest
    static void testUpdateDesc()
    {
       // createAccountData();
        List<Account> accList = [Select id, Phone, Rating,Description from Account where name like 'Test Setup%']; // data will be returned from testSetup method
        for(Account acc: accList)
        {
            acc.Industry = 'Media';
            acc.Phone = '9999999';
        }
        Test.startTest();
        update accList;
        Test.stopTest();
        
        List<Account> accRes = [Select id, Rating,Description from Account where id =: accList[0].id];
        System.assertEquals('Phone is updated, Old Value = null New value = 9999999', accRes.get(0).Description,'Desc is updated');
    }
    
    @isTest
    static void testDeleteAcc()
    {
        List<Account> accList = [Select id, Phone,name, Rating,Description from Account where name like 'Test Setup%'];
        List<contact> conList = new List<Contact> ();
        for(Account acc: accList)
        {
            Contact c = new Contact();
            c.LastName = acc.Name;
            c.FirstName='Test';
            c.AccountId=acc.Id;
            conList.add(c);
        }
        Test.startTest();
        insert conList;
        
        Database.delete(accList,false);
        //System.assert('You cannot delete this account, please contact your System Admin',sr[0].getErrors() ,'Desc is updated');
        
        Test.stopTest();
    }
    
}