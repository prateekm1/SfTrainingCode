public class DynamicApexDemo {
    
    //all objects present 
    public static void getObject()
    {
        List<sObjectType> obList = Schema.getGlobalDescribe().values();
        
        for(sObjectType ob: obList)
        {
            System.debug('Object Name = '+ob.getDescribe().getName());
            System.debug('Field Name = '+ob.getDescribe().fields.getMap().values());
        }
    }
    
    // for Account
    public static void getAccDetails()
    {
        Schema.DescribeSObjectResult acc = Account.SObjectType.getDescribe();
        
        Map<String, Schema.SObjectField> accField = acc.fields.getMap();
        
        for(Schema.SObjectField ob: accField.values())
        {
            System.debug('Field Name '+ob);
        }
        
        //for child relationship details
        List<Schema.ChildRelationship> child = acc.getChildRelationships();
        for(Schema.ChildRelationship res: child)
        {
            if(res.getRelationshipName()!=null)
                System.debug('Relationship Name '+res.getRelationshipName());
        }
    }

}