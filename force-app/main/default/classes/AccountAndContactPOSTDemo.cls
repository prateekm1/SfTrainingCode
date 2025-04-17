@RestResource(urlMapping='/accandconpostdemo/')
global class AccountAndContactPOSTDemo {
	// wrapper class
    global class dataInfo
    {
        global Account accRecord{get; set;}
        global Contact conRecord{get; set;}
    }
    @httpPost
    global static string createRecord(dataInfo info)
    {
        Account acc = info.accRecord;
        Contact con = info.conRecord;
        
        try{
            insert acc;
            con.FirstName = acc.Name;
            con.AccountId = acc.Id;
            insert con;
            return 'Account and Contact created successfully';
        }
        catch(Exception e)
        {
            return e.getMessage();
        }
    }
}