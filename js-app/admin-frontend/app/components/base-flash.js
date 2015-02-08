import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['alert'],
  classNameBindings: ['isSuccess:alert-success', 'isInfo:alert-info', 'isDanger:alert-danger'],
  queuedMessages: Ember.required(),

  hideAfterMs: 2000,
  currentType: null,
  currentMessage: null,

  isSuccess: Ember.computed.equal('currentType', 'success'),
  isInfo: Ember.computed.equal('currentType', 'info'),
  isDanger: Ember.computed.equal('currentType', 'danger'),

  didInsertElement: function() {
    return this.$().hide();
  },

  _queuedMessagesDidChange: (function() {
    var currentMessage, messageQueue, newMessage;
    messageQueue = this.get('queuedMessages');
    currentMessage = this.get('currentMessage');
    if (currentMessage === null && messageQueue.length > 0) {
      newMessage = messageQueue[0];
      this.set('currentType', newMessage.type);
      return this.set('currentMessage', newMessage.message);
    }
  }).observes('queuedMessages.@each'),

  _currentMessageDidChange: (function() {
    var hideAfterMs = this.get('hideAfterMs');

    if (!Ember.isEmpty(this.get('currentMessage'))) {
      this.$().velocity('slideDown');
      Ember.run.later(this, this._clearMessage, hideAfterMs);
    }
  }).observes('currentMessage'),

  _clearMessage: function() {
    return this.$().velocity('slideUp', {
      complete: () => {
        this.set('currentMessage', null);
        return Ember.run.next(this, () => { this.get('queuedMessages').shiftObject(); });
      }
    });
  },

  actions: {
    close: function() {
      return this._clearMessage();
    }
  }
});
