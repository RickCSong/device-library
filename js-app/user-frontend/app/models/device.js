import DS from 'ember-data';

export default DS.Model.extend({
  hardware: DS.attr('string'),
  operatingSystem: DS.attr('string'),
  storageCode: DS.attr('string'),

  barcode: DS.attr('string'),
  details: DS.attr('string'),
  status: DS.attr('string'),

  user: DS.belongsTo('user', {async: true}),
  category: DS.belongsTo('category', {async: true}),

  fullName: function() {
    return `${this.get('hardware')} (${this.get('operatingSystem')})`;
  }.property('hardware', 'operatingSystem')
});
