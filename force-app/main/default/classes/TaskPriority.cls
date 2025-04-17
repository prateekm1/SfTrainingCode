public class TaskPriority {

    public static String getPriority(String code)
    {
        String priority;
        if(String.isBlank(code) || code.length()>2)
            return null;
        
        if(code == 'US')
        {
            priority ='High';
            return priority;
        }
        else
        {
            priority='Medium';
            return priority;
        }
            
    }
}