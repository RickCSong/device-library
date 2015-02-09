import EmberValidations from 'ember-validations';
import BufferedProxy from 'ember-buffered-proxy/proxy';

export default BufferedProxy.extend(EmberValidations.Mixin, {
  validations: {
    category:         { presence: true },
    hardware:         { presence: true },
    operatingSystem:  { presence: true },
    storageCode:      { presence: true },
    barcode:          { presence: true },
  },
  disableSave: function() {
    return !(this.get('isValid') && this.get('hasChanges'));
  }.property('isValid', 'hasChanges')
});

