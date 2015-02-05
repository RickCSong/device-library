export function initialize(container, application) {
  var store = container.lookup('store:main');
  application.deferReadiness();
  $.get('users/current.json', function(data) {
    var id = data.user.id;
    store.pushPayload('user', data);
    store.find('user', id).then(function(user) {
        application.register('user:current', user, {instantiate: false});
        application.inject('controller', 'currentUser', 'user:current');
        application.inject('route', 'currentUser', 'user:current');
        application.advanceReadiness();
      });
  });
}

export default {
  name: 'current-user',
  after: 'store',
  initialize: initialize
};
