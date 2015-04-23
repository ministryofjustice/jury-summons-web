'use strict';

var mainBowerFiles = require('main-bower-files');
var vendorFiles = mainBowerFiles();

var paths = {
  src: 'jury_summons/assets-src/',
  dest: 'jury_summons/assets/',
  styles: [
      'jury_summons/assets-src/stylesheets/**/*.scss',
      'jury_summons/apps/**/assets-src/stylesheets/**/*.scss'
  ],
  ie_styles: 'jury_summons/assets-src/ie/**/*.scss',
  scripts: [
    'jury_summons/assets-src/javascripts/**/*',
    '!jury_summons/assets-src/javascripts/templates.js',
    'jury_summons/apps/**/assets-src/javascripts/**/*',
    '!jury_summons/apps/**/assets-src/javascripts/templates.js'
  ],
  vendor_scripts: vendorFiles,
  images: [
      'jury_summons/assets-src/images/**/*',
      'jury_summons/apps/**/assets-src/images/**/*'
  ],
  templates: [
      'jury_summons/templates/**/*',
      'jury_summons/apps/**/templates/**/*'
  ]
};

module.exports = paths;
