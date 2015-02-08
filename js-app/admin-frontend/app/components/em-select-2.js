import Ember from 'ember';
import FormGroupComponent from 'ember-idx-forms/group';
import ControlMixin from 'ember-idx-forms/mixins/control';
import Select2 from './select-2';

export default FormGroupComponent.extend({
  v_icons: false,
  controlView: Select2.extend(ControlMixin, {
    model: Ember.computed.alias('parentView.model'),
    propertyName: Ember.computed.alias('parentView.propertyName'),
    content: Ember.computed.alias('parentView.content'),
    optionValuePath: Ember.computed.alias('parentView.optionValuePath'),
    optionLabelPath: Ember.computed.alias('parentView.optionLabelPath'),
    placeholder: Ember.computed.alias('parentView.placeholder'),
    multiple: Ember.computed.alias('parentView.multiple'),
    sorted: Ember.computed.alias('parentView.sorted')
  }),
  property: void 0,
  content: void 0,
  optionValuePath: 'label',
  optionLabelPath: 'value',
  placeholder: void 0,
  sorted: null,
  controlWrapper: (function() {
    if (this.get('form.form_layout') === 'horizontal') {
      return 'col-sm-10';
    }
    return null;
  }).property('form.form_layout')
});