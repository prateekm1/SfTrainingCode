public class DataFactory {
    
    public static List<Account> createAccount(String Name, Integer count, Boolean isInsert)
    {
        List<Account> accList = new List<Account>();
        
        for(integer i =0; i<count; i++)
        {
            Account acc = new Account();
            acc.Name = Name+i;
            accList.add(acc);
        }
        
        if(isInsert)
        {
            insert accList;
        }
        return accList;
    }

}