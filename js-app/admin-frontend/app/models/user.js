import DS from 'ember-data';

export default DS.Model.extend({
  username: DS.attr('string'),
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),

  devices: DS.hasMany('device', {async: true}),
  activities: DS.hasMany('activity', {async: true})
});
