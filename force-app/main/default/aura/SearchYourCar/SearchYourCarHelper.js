({
	cartypehelper : function() 
    {
		alert("This is Search buttonn");
	},
    
    getrecord : function(component,event,helper)
    {
        var action = component.get("c.getcars");
        action.setCallback(this,function(data)
        {
            var state = data.getState();
            if(state = "SUCCESS")
            {
                component.set("v.Cartypes",data.getReturnValue());           
            }
            else if(state = "ERROR")
            {
               alert("Unknown Error"); 
            }
       });
        $A.enqueueAction(action);
	}
})