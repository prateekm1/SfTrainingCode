public class OpportunityListController {

    public ApexPages.StandardSetController opps{
        get{
            if(opps==null)
            {
                opps= new ApexPages.StandardSetController(Database.getQueryLocator([select name, stageName from Opportunity]));
            }
            return opps;
        }
        set;
    }
    public List<Opportunity> getOpportunity() {
        return (List<Opportunity>)opps.getRecords();
    }

}