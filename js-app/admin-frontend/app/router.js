import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource("inventory", { path: '/inventory' }, function() {
    this.resource("category", { path: '/:category_id' }, function() {
      this.resource("device", { path: '/:device_id' }, function() {
        this.route('edit');
      });
    });
  });
  this.resource("users", function() {
    this.resource("user", { path: '/:user_id'}, function() {

    });
  });
});

export default Router;
