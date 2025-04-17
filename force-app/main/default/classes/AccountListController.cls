public class AccountListController {

    public ApexPages.StandardSetController acct{
        get{
            if(acct==null)
            {
                acct = new ApexPages.StandardSetController(Database.getQueryLocator([select name, accountnumber from account]));
            }
            return acct;
        }
        set;
    }

    public List<Account> getAccount() {
        return (List<Account>)acct.getRecords();
    }

}