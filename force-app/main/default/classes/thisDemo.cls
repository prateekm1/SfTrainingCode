public class thisDemo {
  
   public void display()
   {
       List<opportunity> oppList = new List<opportunity>();
      // List<opportunity> oppListUpdate = new List<opportunity>();
       oppList = [select stagename, description from opportunity  where LastModifiedDate = THIS_YEAR];
       
       if (!oppList.isEmpty())
       {
           for (Opportunity opp: oppList)
           {
               if(opp.StageName =='Closed Won')
                   opp.Description='Opp is Closed Won new';
               
               else if (opp.StageName=='Closed Lost')
                   opp.Description='Opp is Closed Lost new';
               
               else
                   opp.Description='Opp is still open new';
               
              // oppListUpdate.add(opp);
           }
       }
       
           update oppList;
       
   }
}