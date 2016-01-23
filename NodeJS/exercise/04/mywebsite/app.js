var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var session = require("express-session");
var bodyParser = require('body-parser');

var routes = require('./routes/index');
var admin = require('./routes/admin');

global.logger = require("./util/logger.js");
global.moment = require('moment'); //日期函数全局访问
global.moment.locale('zh-cn');
global.DB = require("./util/dbhelper.js").Instance();

DB.define({
  key: 'Article',
  name: 'article',
  fields: ['id', 'title', 'source', 'source_color', 'intro', 'type', 'show_type', 'thumbnail1', 'thumbnail2', 'thumbnail3', 'iscarousel', 'ishot', 'publishtime','type_name']
});
DB.define({
  key: 'ArticleType',
  name: 'article_type',
  fields: ['id', 'name', 'width']
});
DB.define({
  key: 'Manager',
  name: 'manager',
  fields: ['id', 'username', 'password', 'name']
});

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: false
}));
app.use(cookieParser());
app.use(session({
  secret: 'mywebsite',
  cookie: {
    maxAge: 60000 * 30
  },
  saveUninitialized: true,
  resave: true
}));
app.use(express.static(path.join(__dirname, 'public')));


app.all("/admin/*", function(req, res, next) {
  var islogin = req.session && req.session.manager;
  if (!islogin) {
    res.redirect("/admin");
  } else {
    next();
  }
});

app.use('/', routes);
app.use('/admin', admin);



// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
});


module.exports = app;