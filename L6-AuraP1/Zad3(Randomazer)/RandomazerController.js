({
	Rand : function(component, event, helper) {
        var min = component.get("{!v.min}");
        var max = component.get("{!v.max}");
        
			// function random
		min = Math.ceil(min);
        max = Math.floor(max);
        var rez = Math.floor(Math.random() * (max - min +1)) + min;
    
        component.set("{!v.rez}", rez);
        
    
	},
    Check : function(component, event, helper){
        var min = component.get("{!v.min}");
        var max = component.get("{!v.max}");
        
        // check input fields
        if((min < 0 || min == null) || (max == 0 || max < min || max==null)){
            
           	component.set("{!v.btn}", true);
       	}
       	else{
            
       		component.set("{!v.btn}", false);
       	}
        
        
        
        
            
    }
})