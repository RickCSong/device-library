import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'li',
  classNameBindings: ['active'],
  href: null,
  model: null,
  layout: Ember.HTMLBars.compile(`
    {{#if model}}
      {{#link-to href model}} {{yield}} {{/link-to}}
    {{else}}
      {{#link-to href}} {{yield}} {{/link-to}}
    {{/if}}
  `),

  active: function() {
    return this.get('childViews.firstObject.active');
  }.property('childViews.@each.active')
});
