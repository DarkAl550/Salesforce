({
  init: function(component, event, helper) {
    let flow = component.find("HW");

    flow.startFlow("HW");

    return true;
  },

  //toast
  showToast: function(cmp, event, helper) {
    var showToast = $A.get("e.force:showToast");
    showToast.setParams({
      title: "Custom Toast!",
      message: "The event has fired sucessfully."
    });
    showToast.fire();
  }
});