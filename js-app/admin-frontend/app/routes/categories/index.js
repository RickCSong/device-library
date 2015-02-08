import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel: function() {
    var firstCategory = this.modelFor('categories').get('firstObject');
    if (firstCategory) {
      this.transitionTo('category', firstCategory);
    }
  }
});
