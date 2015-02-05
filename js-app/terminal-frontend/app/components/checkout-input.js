import Ember from 'ember';

export default Ember.TextField.extend({
  classNames: ['checkout-input'],
  type: 'text',
  delay: 500,
  action: 'checkout',

  focusOut: function(event) {
    this.$().focus();
    this.sendAction('focus-out', this, event);
  },

  didInsertElement: function() {
    this.$().focus();
  },

  willDestroyElement: function() {
    Ember.run.cancel(this.get('_setTimer'));
  },

  _setTimer: null,
  _valueDidChange: function() {
    var delay = this.get('delay');
    var value = this.get('value');
    if (Ember.isPresent(value)) {
      var setTimer = Ember.run.debounce(this, this._checkoutAction, delay);
      this.set('_setTimer', setTimer);
    }
  }.observes('value'),

  _checkoutAction: function() {
    var value = this.get('value');
    this.sendAction('action', value);
    this.set('value', '');
  }
});
