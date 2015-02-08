import DS from 'ember-data';

export default DS.Model.extend({
  user: DS.belongsTo('user', {async: true}),
  device: DS.belongsTo('device', {async: true}),

  statusTo: DS.attr('string'),
  statusFrom: DS.attr('string'),
  createdAt: DS.attr('date')
});
