({
  //random function
  rand: function(component, event, helper) {
    let min = component.get("v.min");
    let max = component.get("v.max");
    min = Math.ceil(min);
    max = Math.floor(max);
    var rez = Math.floor(Math.random() * (max - min + 1)) + min;

    component.set("v.rez", rez);
  },

  //function validation
  checkFields: function(component, event, helper) {
    var min = component.get("v.min");
    var max = component.get("v.max");

    if (min < 0 || min == null || (max < min || max == null)) {
      component.set("v.isActiveBtn", true);
    } else {
      component.set("v.isActiveBtn", false);
    }
  }
});