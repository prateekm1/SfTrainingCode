trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete) {
    
    //before
    if(trigger.isBefore){
        if(trigger.isDelete)
        {
            AccountTriggerHandler.deleteAcc(trigger.old);
        }
        
        else if(trigger.isInsert)
        {
           // AccountTriggerHandler.updateRating(trigger.new);
            AccountTriggerHandler.updateRatingNew(trigger.new, null);
        }
        
        else if(trigger.isUpdate)
        {
            AccountTriggerHandler.updateDesc(trigger.new, trigger.oldMap);
            AccountTriggerHandler.updateRatingNew(trigger.new, null);
        }
    }
    
    //after
    else if(trigger.isAfter){
        if(trigger.isInsert)
        {
            AccountTriggerHandler.insertContact(trigger.new);
            AccountTriggerHandler.createOpp(trigger.new);
        }
        if(trigger.isUpdate)
        {
            AccountTriggerHandler.updateContact(trigger.new, trigger.oldMap);
        }
    }
}