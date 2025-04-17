public class TemperatureConverter {
	public static Decimal ferhToCel(Decimal temp)
    {
        Decimal cel = (temp-32)*5/9;
        system.debug('Temp is : '+cel.setScale(2));
        return cel.setScale(2); // display upto 2 decimal points
    }
}