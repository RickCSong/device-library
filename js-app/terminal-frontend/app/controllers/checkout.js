import Ember from 'ember';

export default Ember.Controller.extend({
  userId: null,
  resetUserDelay: 1000 * 30, // 30 Seconds

  _userIdDidChange: function() {
    var userId = this.get('userId');
    var delay = this.get('resetUserDelay');
    if (Ember.isPresent(userId)) {
      Ember.run.debounce(this, this._resetUserId, delay);
    }
  }.observes('userId'),

  _resetUserId: function() {
    this.set('userId', null);
  },

  actions: {
    checkout: function() {
      // Resets the delay if the user scans another device.
      var delay = this.get('resetUserDelay');
      Ember.run.debounce(this, this._resetUserId, delay);
      // Bubbles the action up to the route.
      return true;
    }
  }
});
