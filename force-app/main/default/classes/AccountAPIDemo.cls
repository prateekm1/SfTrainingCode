@RestResource(urlMapping='/accountapidemo/*')
global class AccountAPIDemo {
	@HttpGet
    global static List<Account> getAccount()
    {
        Map<string, string> paramMap = RestContext.request.params;
        String accIndustry = paramMap.get('Industry');
       // List<Account> accList = [Select id, name, industry, AnnualRevenue from Account where AnnualRevenue != null and Industry =: accIndustry order by AnnualRevenue desc limit 10];
       	List<Account> accList = [Select id, name, industry, AnnualRevenue from Account where AnnualRevenue != null order by AnnualRevenue desc limit 10];
    	return accList;
    }
}