import Ember from 'ember';
import DeviceForm from 'admin-frontend/models/device-form';
import BufferedChangeRoute from 'admin-frontend/mixins/buffered-change-route';

export default Ember.Route.extend(BufferedChangeRoute, {
  model: function() {
    var device = this.modelFor('device');
    return DeviceForm.create({
      content: device
    });
  },

  willTransitionConfirm: function() {
    return window.confirm("You have unsaved changes that will be lost. Do you want to continue?");
  },

  actions: {
    save: function() {
      var buffer = this.get('controller.model');
      var device = this.get('controller.model.content');
      buffer.applyChanges();

      device.save().then(
        // Success
        () => {
          this.send('flash', 'success', 'Device has been successfully updated.');
        },
        // Error
        () => {
          this.send('flash', 'danger', `Error has occurred.  Unable to update ${device.get('fullName')}.`);
          // TODO: Note that there is a bug currently where belongsTo relations are NOT rolled-back by
          // rollback().  Thus, the user will get in an out-of-sync state when he changes the category
          // loses connection, and then attempts a save.  It will rollback all changes except for category.
          // This bug should be a P5 because it should rarely happen.  Just interesting.
          device.rollback();
        }
      );
    },
    cancel: function() {
      var buffer = this.get('controller.model');
      buffer.discardChanges();
      this.transitionTo('devices');
    },
    destroy: function() {
      var device = this.get('controller.model.content');
      device.destroyRecord().then(
        // Success
        () => {
          this.send('flash', 'success', 'Device has been destroyed.');
        },
        // Error
        () => {
          this.send('flash', 'danger', `Error has occurred.  Unable to delete ${device.get('fullName')}.`);
          device.rollback();
        }
      );
    }
  }
});
