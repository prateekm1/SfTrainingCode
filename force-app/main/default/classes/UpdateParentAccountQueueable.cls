public class UpdateParentAccountQueueable implements Queueable{
    
    private List<Account> accList;
    private Id parentId;
    
    //constructor
    public UpdateParentAccountQueueable(List<Account> accRecords, Id accId)
    {
        this.accList = accRecords;
        this.parentId = accId;
    }
    
    public void execute(QueueableContext qc)
    {
        for(Account acc: accList)
        {
            acc.ParentId = parentId;
        }
        update accList;
    }

}