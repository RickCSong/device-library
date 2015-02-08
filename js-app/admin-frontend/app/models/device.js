import Ember from 'ember';
import DS from 'ember-data';
import EmberValidations from 'ember-validations';

export default DS.Model.extend({
  // validations: {
  //   category: {
  //     presence: true
  //   },
  //   hardware: {
  //     presence: true
  //   },
  //   operatingSystem: {
  //     presence: true
  //   },
  //   storageCode: {
  //     presence: true
  //   },
  //   barcode: {
  //     presence: true
  //   }
  // },
  // notValid: Ember.computed.not('isValid'),

  hardware: DS.attr('string'),
  operatingSystem: DS.attr('string'),
  storageCode: DS.attr('string'),

  barcode: DS.attr('string'),
  details: DS.attr('string'),
  status: DS.attr('string'),

  user: DS.belongsTo('user', {async: true}),
  category: DS.belongsTo('category', {async: true}),
  activities: DS.hasMany('activity', {async: true}),

  fullName: function() {
    return `${this.get('hardware')} (${this.get('operatingSystem')})`;
  }.property('hardware', 'operatingSystem')
});
