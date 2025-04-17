public class UpsertAccount {

    public Account account{get; private set;}
    
    public UpsertAccount()
    {
        Id id = ApexPages.currentPage().getParameters().get('id');
        
        account = (id==null) ? new Account() : [select Id, Name, Phone, Industry from Account where Id=:id];
         
    }
    
    public pageReference save()
    {
        try{
            upsert(account);
        }
        catch(System.DMLException e)
        {
            ApexPages.addMessages(e);
            return null;
        }
        
        PageReference redirectSuccess = new ApexPages.standardController(Account).view();
        return  redirectSuccess;
    }
}