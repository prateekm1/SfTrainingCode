public class CalcDemo {
	 integer add(integer a, integer b)
    {
        return a+b;
    }
    public integer sub(integer a, integer b)
    {
        if(a>b)
            return a-b;
        else 
            return b-a;
    }
    public integer mul(integer a, integer b)
    {
        return a*b;
    }
    public integer divide(integer a, integer b)
    {
        if (a>b)
            return a/b;
        else 
            return b/a;
    }
    
    public void result(integer a, integer b)
    {
        integer addRes = add(a,b);
        integer subRes = sub(a,b);
        integer mulRes = mul(a,b);
        integer divideRes = divide(a,b);
        
        map<string, integer> resMap = new Map<string, integer>();
        resMap.put('Add result', addRes);
        resMap.put('Sub result', subRes);
        resMap.put('Mul result', mulRes);
        resMap.put('Divide result', divideRes);
        
        System.debug(resMap);
    }
}