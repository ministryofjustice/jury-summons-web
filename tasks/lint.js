'use strict';

var gulp = require('gulp');
var paths = require('./_paths');
var jshint = require('gulp-jshint');
var stylish = require('jshint-stylish');
var filter = require('gulp-filter');
var gulpif = require('gulp-if');

var lintFn = function(failFast) {
  return function() {
    var withoutTemplates = filter(['**/*.js', '!**/*templates.js']);

    gulp
      .src(paths.scripts)
      .pipe(withoutTemplates)
      .pipe(jshint())
      .pipe(jshint.reporter(stylish))
      .pipe(gulpif(failFast, jshint.reporter('fail')));
  };
};

gulp.task('lint', lintFn(false));
gulp.task('lint-ci', lintFn(true));
