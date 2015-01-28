# for more details see: http://emberjs.com/guides/models/defining-models/

DeviceLibrary.Device = DS.Model.extend
  hardware: DS.attr 'string'
  operatingSystem: DS.attr 'string'
  storageCode: DS.attr 'string'
  barcode: DS.attr 'string'
  status: DS.attr 'number'
  details: DS.attr 'string'
  user: DS.belongsTo 'user'
  category: DS.belongsTo 'category'
