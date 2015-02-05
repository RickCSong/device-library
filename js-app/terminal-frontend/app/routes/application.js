import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    flash: function(type, message) {
      this.get('controller').send('flash', type, message);
    }
  }
});
