import Ember from 'ember';
import BufferedChangeRouteMixin from 'admin-frontend/mixins/buffered-change-route';

module('BufferedChangeRouteMixin');

// Replace this with your real tests.
test('it works', function() {
  var BufferedChangeRouteObject = Ember.Object.extend(BufferedChangeRouteMixin);
  var subject = BufferedChangeRouteObject.create();
  ok(subject);
});
