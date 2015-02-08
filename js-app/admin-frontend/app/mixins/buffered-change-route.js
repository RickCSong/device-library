import Ember from 'ember';

export default Ember.Mixin.create({
  actions: {
    willTransition: function(transition) {
      var model = this.get('controller.model');
      if (model.get('hasChanges') && !this.willTransitionConfirm(transition)) {
        transition.abort();
      }
    }
  },
  willTransitionConfirm: function(transition) {
    /*jshint unused:false*/
    return true;
  }
});
