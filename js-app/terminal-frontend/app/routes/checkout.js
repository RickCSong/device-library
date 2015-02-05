import Ember from 'ember';

export default Ember.Route.extend({
  setupController: function(controller) {
    controller.set('userId', null);
  },

  actions: {
    checkout: function(barcode) {
      var userId = this.get('controller.userId');
      Ember.$.post('/devices/checkout.json', {barcode: barcode, user_id: userId}).then(
        function(res) {
          console.log(res.responseJSON);
        },
        function(err) {
          console.log(err);
        }
      );
    }
  }
});
