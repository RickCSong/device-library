import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'button',
  classNames: 'btn',
  attributeBindings: ['disabled'],

  loading: false,
  disable: false,
  action: 'save',
  disabled: Ember.computed.or('loading', 'disable'),

  layout: Ember.HTMLBars.compile(`
    {{#if loading}}
      <i class="fa fa-spinner fa-spin"></i>
    {{else}}
      {{yield}}
    {{/if}}
  `),

  click: function() {
    this.sendAction();
    return false;
  },
});
