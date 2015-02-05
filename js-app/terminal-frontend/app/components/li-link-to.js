import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'li',
  classNameBindings: ['active'],
  href: null,
  layout: Ember.HTMLBars.compile('{{#link-to href}} {{yield}} {{/link-to}}'),

  active: function() {
    return this.get('childViews.firstObject.active');
  }.property('childViews.@each.active')
});
