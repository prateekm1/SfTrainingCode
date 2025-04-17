@isTest
public class TaskPriorityTest {

    @isTest
    static void mediumPriority()
    {
        String res = TaskPriority.getPriority('AU');
        system.assertEquals('Medium', res);
    }
    
    @isTest
    static void highPriority()
    {
        String res = TaskPriority.getPriority('US');
        system.assertEquals('High', res);
    }
    
    @isTest
    static void nullPriority()
    {
        String res = TaskPriority.getPriority('IND');
        system.assertEquals(null, res);
    }
}