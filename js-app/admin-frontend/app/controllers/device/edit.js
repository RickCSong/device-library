import Ember from 'ember';

export default Ember.ObjectController.extend({
  needs: ['categories'],
  categories: Ember.computed.alias('controllers.categories.content'),
  device: Ember.computed.alias('model.content'),

  categoryOptions: function() {
    return this.get('categories').map(function(category) {
      return {
        id: category.get('id'),
        label: category.get('name'),
        value: category
      };
    });
  }.property('categories.@each'),
});
