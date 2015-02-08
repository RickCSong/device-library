/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp();

// JS
app.import('bower_components/bootstrap/dist/js/bootstrap.js');
app.import('bower_components/select2/select2.js');
app.import('bower_components/velocity/velocity.js');

// CSS
app.import('bower_components/bootstrap/dist/css/bootstrap.css');
app.import('bower_components/bootstrap/dist/css/bootstrap.css.map', {
  destDir: 'assets'
});

// ASSETS
var pickFiles = require('broccoli-static-compiler');
var bootstrapFonts = pickFiles('bower_components/bootstrap/dist/fonts', {
  srcDir: '/',
  destDir: '/assets/fonts'
});

var fontAwesomeFonts = pickFiles('bower_components/fontawesome/fonts', {
  srcDir: '/',
  destDir: '/fonts'
});

var sqMarketFonts = pickFiles('vendor/bootstrap-square/fonts', {
  srcDir: '/',
  destDir: '/assets/fonts'
});

module.exports = app.toTree([bootstrapFonts, fontAwesomeFonts, sqMarketFonts]);
