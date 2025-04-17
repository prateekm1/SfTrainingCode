public class OppSchedulable implements Schedulable{
    
    public void execute(SchedulableContext sc)
    {
        List<Opportunity> oppList =[Select Id, LeadSource from Opportunity where LeadSource = null];
        
        for(Opportunity opp: oppList)
        {
            opp.LeadSource = 'Other';
        }
        if(!oppList.isEmpty())
            update oppList;
    }

}