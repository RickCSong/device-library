import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route("checkout", function() {});
  this.route("return", function() {});
  this.route("search", function() {});
});

export default Router;
