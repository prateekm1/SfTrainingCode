({
	getOpps : function(cmp, event) {
		var action = cmp.get("c.getOpp");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS")
            {
                cmp.set("v.opportunities", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})