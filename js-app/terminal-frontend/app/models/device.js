import DS from 'ember-data';

export default DS.Model.extend({
  hardware: DS.attr('string'),
  operatingSystem: DS.attr('string'),
  storageCode: DS.attr('string')
});
