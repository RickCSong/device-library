import Ember from 'ember';

export default Ember.Mixin.create({
  willTransitionConfirm: function(transition) {
    /*jshint unused:false*/
    return true;
  },

  resetController: function() {
    var buffer = this.get('controller.model');
    var model = buffer.get('content');
    if(!model.get('isDeleted')) {
      if (model.get('isNew')) {
        model.deleteRecord();
      } else {
        model.rollback();
      }
    }
  },

  actions: {
    willTransition: function(transition) {
      var buffer = this.get('controller.model');
      var model = buffer.get('content');
      if (buffer.get('hasChanges') && model.get('isDirty') && !this.willTransitionConfirm(transition)) {
        transition.abort();
      }
    }
  }
});
