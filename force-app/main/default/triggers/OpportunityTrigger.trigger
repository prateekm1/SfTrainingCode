trigger OpportunityTrigger on Opportunity (after update) {
    if(trigger.isUpdate)
    {
        if(trigger.isAfter)
        {
            if(!preventRecurssion.recurssion){
                system.debug('inside trigger');
                preventRecurssion.recurssion = true;
                OpportunityTriggerHandler.updateDesc(trigger.new, trigger.oldMap);
            }
            
        }
    }
}