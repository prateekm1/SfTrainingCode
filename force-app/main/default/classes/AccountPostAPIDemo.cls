@RestResource(urlMapping ='/accpostapidemo/')
global class AccountPostAPIDemo {

    //POST to create account
    @HttpPost
    global static String createAccount(string accName,string accRating, string accIndustry)
    {
        Account acc = new Account();
        acc.Name = accName;
        acc.Rating = accRating;
        acc.Industry = accIndustry;
        
        try{
            insert acc;
            return ' Account inserted successfully';
        }
        catch(Exception e)
        {
           return e.getMessage();
        }
    }
}