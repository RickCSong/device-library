import Ember from 'ember';
import DataRouteMixin from 'ember-data-route/mixins/data-route';

export default Ember.Route.extend(DataRouteMixin, {
  willTransitionConfirm: function() {
    return window.confirm("You have unsaved changes that will be lost. Do you want to continue?");
  },

  actions: {
    save: function() {
      var device = this.get('controller.model');
      console.log(device);
      this.send('flash', 'success', 'YAYYYYYYY!');
    },
    cancel: function() {
      var device = this.get('controller.model');
      device.rollback();
      this.transitionTo('devices');
    },
    destroy: function() {
      var device = this.get('controller.model');
      console.log(device);
      this.send('flash', 'danger', 'DANGERRRRR!');
    }
  }
});
