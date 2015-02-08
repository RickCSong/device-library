import Ember from 'ember';
import EmberValidations from 'ember-validations';
import BufferedMixin from 'ember-buffered-proxy/mixin';

export default Ember.ObjectController.extend(BufferedMixin, EmberValidations.Mixin, {
  needs: ['categories'],
  categories: Ember.computed.alias('controllers.categories.content'),

  categoryOptions: function() {
    return this.get('categories').map(function(category) {
      return {
        id: category.get('id'),
        label: category.get('name'),
        value: category
      };
    });
  }.property('categories.@each'),

  validations: {
    category: {
      presence: true
    },
    hardware: {
      presence: true
    },
    operatingSystem: {
      presence: true
    },
    storageCode: {
      presence: true
    },
    barcode: {
      presence: true
    }
  },
  notValid: Ember.computed.not('isValid'),
});
