export function initialize(container, application) {
  var store = container.lookup('store:main');
  application.deferReadiness();
  store.find('user').then(function(users) {
    application.register('users:all', users, {instantiate: false});
    application.inject('controller', 'users', 'users:all');
    application.inject('route', 'users', 'users:all');
    application.advanceReadiness();
  });
}

export default {
  name: 'users',
  after: 'store',
  initialize: initialize
};
