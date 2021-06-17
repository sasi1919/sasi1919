({
	newbutton : function(component, event, helper) 
    {
		var createrecord = $A.get("e.force:createRecord");
        createrecord.setParams
        (
            {
                "entityApiName" : "Car_Type__c" 
            }
        );
        createrecord.fire();
	},
    searchbutton : function(component, event, helper)
    {
   		 helper.cartypehelper();
    },
    auraidselection : function (component, event, helper)
    {
        //debugger;
        var selectedvalue = component.find("Cartype").get("v.value");
        console.log("Car type value : "+ selectedvalue);
        alert(selectedvalue + "selected");
    },
    doinit : function(component, event, helper)
    {
        var createrecord = $A.get("e.force:createRecord");
        if(createrecord)
        {
            component.set("v.newlable",true);
        }
        else
        {
           component.set("v.newlable",false); 
        }
        helper.getrecord(component,event,helper);
    },    
})