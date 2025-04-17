@RestResource(urlMapping ='/accmgmtapidemo2/*')
global class AccountMgmtAPIDemo2 {
    //Wrapper class
    global class AccountWrapper{
        global List<Account> accList;
        global List<Contact> conList;
        global List<Case> caseList;
    }
    @HttpGet
    global static AccountWrapper getRecord()
    {
        Map<string,string> paramMap = RestContext.request.params;
        string accIndustry = paramMap.get('Industry');
        
        Set<Id> accId = new Set<Id>();
        
        List<Account> accList =[select id, name, industry from Account where industry =: accIndustry];
        
        for(Account acc: accList){
            accId.add(acc.Id);
        }
        List<Contact> conList =[select id, firstname, lastName, phone, Account.Name from Contact where AccountId in: accId];
        List<Case> caseList =[select id, CaseNumber, status,Account.Name from Case where AccountId in: accId];
        
        AccountWrapper accWrapper = new AccountWrapper();
        accWrapper.accList = accList;
        accWrapper.conList = conList;
        accWrapper.caseList = caseList;
        
        return accWrapper;
    }
    
}