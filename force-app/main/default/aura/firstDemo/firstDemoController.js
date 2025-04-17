({
	add : function(component) {
		var result = component.get("v.var1") + component.get("v.var2");
        component.set("v.sum",result);
	}
})