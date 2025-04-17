({
	echo : function(cmp,event) {
		var action = cmp.get("c.serverEcho");
        action.setParams({
            firstname:cmp.get("v.firstname")
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state==="SUCCESS")
            {
                alert("This is a message from server -- "+response.getReturnValue());
            }
            else if(state==="INCOMPLETE")
            {
                //do something
            }
            else if(state==="ERROR")
            {
                var errors=response.getError();
                if(errors)
                {
                    console.log("Error: "+errors);
                }
            }
        });
        $A.enqueueAction(action);
    }
})