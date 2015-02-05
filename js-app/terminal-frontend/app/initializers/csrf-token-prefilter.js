import Ember from 'ember';

export function initialize() {
  Ember.$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
    if (!jqXHR.crossDomain) {
      var token = $('meta[name="csrf-token"]').attr('content');
      return jqXHR.setRequestHeader('X-CSRF-Token', token);
    }
  });
}

export default {
  name: 'csrf-token-prefilter',
  initialize: initialize
};
