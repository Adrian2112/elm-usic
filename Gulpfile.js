'use strict';

var gulp = require('gulp');
var connect = require('gulp-connect');
var elm  = require('gulp-elm');
var sass = require('gulp-sass');
var uglify = require('gulp-uglifyjs');

gulp.task('elm', function() {
  return gulp.src('app/elm/App.elm')
  .pipe(elm())
  .pipe(gulp.dest('app/js/'))
});

gulp.task('sass', function () {
  return gulp.src('app/sass/**/*.scss')
  .pipe(sass().on('error', sass.logError))
  .pipe(gulp.dest('dist/css/'))
  .pipe(connect.reload());
});

gulp.task('html', function () {
  return gulp.src('dist/index.html')
  .pipe(connect.reload());
});

gulp.task('js', function() {
  return gulp.src('app/js/**/*.js')
  .pipe(uglify('app.min.js'))
  .pipe(gulp.dest('dist/js'))
  .pipe(connect.reload());
});

gulp.task('connect', function() {
  return connect.server({
    root: 'dist',
    livereload: true
  });
});

gulp.task('watch', function () {
  gulp.watch(['./app/elm/**/*.elm'], ['elm']);
  gulp.watch(['./app/sass/**/*.scss'], ['sass']);
  gulp.watch(['./app/js/**/*.js'], ['js']);
  gulp.watch(['./dist/index.html'], ['html']);
});

gulp.task('default', ['elm', 'js', 'sass', 'connect', 'watch']);

