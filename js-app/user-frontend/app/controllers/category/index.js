import Ember from 'ember';
import 'user-frontend/utils/regexp';

export default Ember.Controller.extend({
  category: Ember.inject.controller('category'),

  search: '',

  filteredContent: function() {
    var content = this.get('content');
    var search = this.get('search');
    var escapedSearch = new RegExp(RegExp.escape(this.get('search')), 'i');

    if (Ember.isPresent(search) && Ember.isPresent(content)) {
      content = content.filter(function(c) {
        return c.get('fullName').toString().match(escapedSearch);
      });
    }

    return content;
  }.property('search', 'content.@each')
});
