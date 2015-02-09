import Ember from 'ember';
import DeviceForm from 'admin-frontend/models/device-form';
import BufferedChangeRoute from 'admin-frontend/mixins/buffered-change-route';

export default Ember.Route.extend(BufferedChangeRoute, {
  controllerName: 'device.edit',
  model: function() {
    var category = this.modelFor('category');
    var device = this.store.createRecord('device', {
      category: category
    });
    return DeviceForm.create({
      content: device
    });
  }
});
