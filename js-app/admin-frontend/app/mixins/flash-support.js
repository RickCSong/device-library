import Ember from 'ember';

export default Ember.Mixin.create({
  _initQueuedMessages: function() {
    this.set('queuedMessages', []);
  }.on('init'),

  actions: {
    flash: function(type, message) {
      return this.get('queuedMessages').pushObject({
        type: type,
        message: message
      });
    }
  }
});
