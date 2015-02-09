import FormGroupComponent from 'ember-idx-forms/group';

export default {
  name: 'ember-forms',
  initialize: function() {
    FormGroupComponent.reopen({
      displayControlHelp: false,

      helpDisplayClass: function() {
        return this.get('displayControlHelp') ? 'display-help-block' : '';
      }.property('displayControlHelp'),

      focusOut: function() {
        this.set('displayControlHelp', false);
        return this.set('canShowErrors', true);
      },

      focusIn: function() {
        return this.set('displayControlHelp', true);
      }
    });
  }
};
