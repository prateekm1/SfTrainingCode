public class OpportunityTriggerHandler {

    public static void updateDesc(List<Opportunity> oppList, Map<Id, Opportunity> oldMap)
    {
        List<Opportunity> oppToUpdate = new List<Opportunity>();
        for(Opportunity opp: oppList){
            Opportunity o = new Opportunity();
            o.Id = opp.Id;
            if(opp.StageName != oldMap.get(opp.Id).StageName){
                if(opp.StageName == 'Closed Won'){
                    o.Description='Opp is Closed Won';
                }
                else if (opp.StageName == 'Closed Lost'){
                    o.Description='Opp is Closed Lost';
                }
                oppToUpdate.add(o);
            }
            if(!oppToUpdate.isEmpty())
            {
                update oppToUpdate;
            }
        }
    }
}