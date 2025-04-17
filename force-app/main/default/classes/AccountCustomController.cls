public class AccountCustomController {

    public PageReference saveThisRecord() {
        update account;
        return null;
    }


    private final Account account;
    
    //constructor
    public AccountCustomController(){
        account = [Select Id, Name, Site from Account where Id =: ApexPages.currentPage().getParameters().get('id')]; //gets id of current record from URL
    }
    
    public Account getAccount()
    {
        return account;
    }

}