import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel: function() {
    var firstCategory = this.modelFor('inventory').get('firstObject');
    if (firstCategory) {
      this.transitionTo('category', firstCategory);
    }
  }
});
