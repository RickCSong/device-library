import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    return: function(barcode) {
      Ember.$.post('/devices/return.json', {barcode: barcode}).then(
        () => {
          this.send('flash', 'success', 'YAYYYYYYY!');
        },
        () => {
          this.send('flash', 'danger', 'NOOOOOOO!');
        }
      );
    }
  }
});
