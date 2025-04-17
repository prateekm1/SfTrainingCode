public class DynamicSOQLDemo {
    
    public static void dynamicSOQL()
    {
        Map<String, Object> accBind = new Map<String, Object>{'accName'=>'Dickenson plc'};
            
            List<Account> accList = Database.queryWithBinds('SELECT Id, Name FROM Account WHERE Name =: accName', accBind, AccessLevel.USER_MODE);
        
        	system.debug('Access Mode: '+AccessLevel.USER_MODE);
        	for(Account acc: accList)
            {
                 System.debug('Name '+acc.Name);
            }
        
    }
    
    public static void dynamicOpp()
    {
        string stage ='Closed Won';
        string accIndustry ='Media';
        Decimal amount = 10000;
        
        Map<String,Object> bind = new MaP<String,Object>();
        bind.put('amount', amount);
        bind.put('stage',stage);
        bind.put('accIndustry',accIndustry);

        String query= 'SELECT Id, Name, StageName, Amount, Account.Name, Account.Industry '+
            			'FROM Opportunity '+
            			'WHERE StageName =: stage '+
            			'AND Amount >: amount';
        query += ' AND Account.Industry = :accIndustry';
        List<Opportunity> oppList = Database.queryWithBinds(query, bind, AccessLevel.USER_MODE);
        for(Opportunity opp: oppList)
        {
            System.debug('Name : '+opp.Name);
             System.debug('Stage : '+opp.StageName);
             System.debug('Account Name : '+opp.Account.Name);
             System.debug('Amount : '+opp.Amount);
        }
        
    }

}