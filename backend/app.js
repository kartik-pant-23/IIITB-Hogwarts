const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const bodyParser = require("body-parser");
const mongoose = require("mongoose");

const indexRouter = require('./routes/index');
const usersRouter = require('./routes/users');
const registrationRouter = require('./routes/registration');
const groupsRouter = require('./routes/groups');
const blogsRouter = require('./routes/Blogs');
const discussionRouter = require('./routes/discussions');

const connectDb = require('./routes/db_controller');

const app = express();

// view engine setup
// app.set('views', path.join(__dirname, 'views'));
// app.set('view engine', 'jade');
// app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(bodyParser.json({}));
app.use(bodyParser.urlencoded({extended: true}));
// app.use(express.static(path.join(__dirname, 'public')));

connectDb();

app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*')
  res.header('Access-Control-Allow-Headers', '*')
  if(req.method == 'OPTIONS') {
      res.header('Access-Control-Allow-Methods', 'PUT, POST, DELETE, PATH, GET')
      return res.status(200).json({})
  }
  next()
})

app.get('/', (req, res) => {
  res.send('You reached the place-IIITB Hogwarts')
});
app.use('/index', indexRouter);
app.use('/users', usersRouter);
app.use('/register',registrationRouter);
app.use('/groups',groupsRouter);
app.use('/blogs', blogsRouter)
app.use('/discussions', discussionRouter)

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  //res.render('error');
});

module.exports = app;