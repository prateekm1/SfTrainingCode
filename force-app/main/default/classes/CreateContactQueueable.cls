public class CreateContactQueueable implements Queueable{
    
    private List<Account> accList;
    
    public CreateContactQueueable(List<Account> accRecords)
    {
        this.accList = accRecords;
    }
    public void execute(QueueableContext qc){ 
        List<Contact> conList = new List<Contact>();
        
        for(Account acc: accList)
        {
            Contact con = new Contact();
            con.FirstName = 'Queueable';
            con.LastName = acc.name;
            con.AccountId = acc.Id;
            conList.add(con);
        }
        system.debug('###'+conList);
        insert conList;
            } 
}