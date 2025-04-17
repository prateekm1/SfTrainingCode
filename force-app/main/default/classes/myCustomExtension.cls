public class myCustomExtension {

    private final Account acc;
    public myCustomExtension(ApexPages.StandardController stdController) {
        this.acc = (Account)stdController.getRecord();
    }

    public string getGreeting()
    {
        return 'Hello '+acc.Name+' ('+acc.id+')';
    }
}