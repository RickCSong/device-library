import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource("catalog", function() {
    this.resource("category", { path: '/:category_id' }, function() {

    });
  });
  this.resource("holdings", function() {

  });
});

export default Router;
