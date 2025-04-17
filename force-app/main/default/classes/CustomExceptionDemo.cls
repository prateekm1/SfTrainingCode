public class CustomExceptionDemo {
    public static void mainProcess()
    {
        try{
            insertAcc();
        }
        catch(AccountException e)
        {
            system.debug('Message: '+e.getMessage());
            system.debug('Cause: '+e.getCause());
        }
    }
    
    public static void insertAcc()
    {
        try{
            Account acc = New Account(Industry ='Media');
            insert acc;
        }
        catch(DMLException dl)
        {
            throw new AccountException('## An Error is occured '+dl);
        }
    }
}