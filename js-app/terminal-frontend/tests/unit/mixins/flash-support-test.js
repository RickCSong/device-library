import Ember from 'ember';
import FlashSupportMixin from 'terminal-frontend/mixins/flash-support';

module('FlashSupportMixin');

// Replace this with your real tests.
test('it works', function() {
  var FlashSupportObject = Ember.Object.extend(FlashSupportMixin);
  var subject = FlashSupportObject.create();
  ok(subject);
});
