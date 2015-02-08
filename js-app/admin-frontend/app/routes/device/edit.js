import Ember from 'ember';
import BufferedProxy from 'ember-buffered-proxy/proxy';
import BufferedChangeRoute from 'admin-frontend/mixins/buffered-change-route';

export default Ember.Route.extend(BufferedChangeRoute, {
  setupController: function(controller, model) {
    var buffer = BufferedProxy.create({
      content: model
    });
    controller.set('model', buffer);
  },

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
