@isTest
public class TemperatureConverterTest {

    @isTest
    public static void testTemp()
    {
        Test.startTest();
        Decimal ces = TemperatureConverter.ferhToCel(180);
        system.assertEquals(82.22,ces);
    }
    
    @isTest
    public static void testTemp2()
    {
        Test.startTest();
        Decimal ces = TemperatureConverter.ferhToCel(180);
        system.assertNotEquals(92.22,ces);
    }
}