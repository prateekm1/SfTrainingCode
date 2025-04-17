public class AccountTriggerHandler {

    //Method to create opp when account is created
    public static void createOpp(List<Account> accList)
    {
       List<opportunity> oppList = new List<opportunity>();
        for(Account acc: accList){
                Opportunity opp = new opportunity();
                opp.Name = acc.Name + ' - New Opp';
                Date today = Date.today();
                opp.CloseDate= today;  // we can use system.today()
                opp.StageName='Prospecting';
                opp.AccountId= acc.Id;
                
                oppList.add(opp);
            }
        if(!oppList.isEmpty())
            insert oppList;
    }
    
    //Method to create contact when account is created
    public static void insertContact(List<Account> accList)
    {
       
        list<Contact> conList = new List<Contact>();
            for(Account acc: accList)
            {
                Contact con = new Contact();
                con.LastName = acc.Name;
                con.FirstName = 'Dummy';
                con.AccountId = acc.Id;
                conList.add(con);
            }
            Insert conList;
    }
    
    //method to update rating if Industry is Media - BEFORE INSERT
  /*  public static void updateRating(List<Account> accList)
    {
        for(Account acc: accList)
            {
                if(acc.Industry !=null && acc.Industry =='Apparel')
                    acc.Rating='Warm';
            }
    }
    */
    //method to update rating if Industry is Media - BEFORE UPDATE & INSERT
    public static void updateRatingNew(List<Account> accList, Map<Id, Account> oldMap)
    {
        for(Account acc: accList)
            {
                if((oldMap==null && acc.Industry !=null && acc.Industry =='Media') || 
                   (oldMap !=null && acc.Industry != null && acc.Industry != oldMap.get(acc.Id).Industry && acc.Industry =='Media'))
                    acc.Rating='Hot';
            }
    }
    
    // method to throw error when deleting account with contacts
    public static void deleteAcc(List<Account> accList)
    {
       Profile adminProfile = [Select Id from Profile where name ='System Administrator'];
        
        Set<Id> accId = new set<Id>();
                for(Account acc: accList)
                {
                    accId.add(acc.Id);
                }
                
                map<id, Account> accMap = new map<id, Account>([select id, name, (select id from contacts) from account where id in :accId]);
                for(Account acc: accList)
                {
                    if(accMap.get(acc.Id).contacts.size()>0 || UserInfo.getProfileId() != adminProfile.Id)
                        acc.addError(Label.Account_Delete_Error); // custom label Account_Delete_Error
                }
    }
    
    // method to update description when Phone is updated
    public static void updateDesc(List<Account> accList, map<id, Account> accOldMap)
    {
       for(Account acc: accList)
       {
           if(acc.Phone != accOldMap.get(acc.Id).phone)
           {
               acc.Description ='Phone is updated, Old Value = '+accOldMap.get(acc.Id).phone+' New value = '+acc.Phone;
           }
       }
    }
    
    //method to populate phone on all related contacts on phone update on account 
      public static void updateContact(List<Account> accList, map<id, Account> accOldMap)
      {
          list<Contact> conList = new list<contact>();
         // map<Id, Account> accMap = new map<Id, Account>(); // used when using Map
          set<Id> accSet = new set<Id>();
          for(Account acc: accList)
          {
              if(accOldMap.get(acc.Id).Phone != acc.Phone)
              {
                 // accMap.put(acc.Id,acc);
                 accSet.add(acc.Id);
              }
          }
          //code for using Map
        /*  for(Contact con: [select id, phone, accountId from contact where AccountId in :accMap.keySet()])
          {
              if(accMap.containsKey(con.AccountId))
              {
                  con.Phone = accMap.get(con.AccountId).phone;
                  conList.add(con);
              }
          } */ 
          
          //using parent-child SOQL
          for(Account acc: [select id, Phone, (select phone from contacts) from account where id in :accSet])
          {
              if(acc.contacts != null)
              {
                  for(Contact con: acc.contacts)
                  {
                      con.Phone = acc.Phone;
                      conList.add(con);
                  }
              }
          }
          if(!conList.isEmpty())
              update conList;
      } 
}