'use strict';

/*******************************************************************
  IMPORTS
*******************************************************************/
require('dotenv').config();
const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const helmet = require('helmet');
const { NODE_ENV, CLIENT_ORIGIN, DATABASE_URL } = require('./config');
const knex = require('knex');
const authRouter = require('./auth/auth-router');
const photosRouter = require('./photos/photos-router');
// const validateBearerToken = require() needs work
const errorHandler = require('./bin/errorHandler');


/*******************************************************************
  INIT
*******************************************************************/
const app = express(); 
const db = knex({
  client: 'pg',
  connection: DATABASE_URL
})


/*******************************************************************
  MIDDLEWARE
*******************************************************************/
app.use(
  morgan(NODE_ENV === 'production' ? 'tiny' : 'common', {
    skip: () => NODE_ENV === 'test',
  })
);
app.use(helmet());
app.use(
  cors({
    origin(origin, callback) {
      if (origin === CLIENT_ORIGIN || !origin) {
        callback(null, true);
      } else {
        callback(new Error('Not allowed by CORS'));
      }
    },
  })
);
app.set('db', db);

/*******************************************************************
  ROUTES
*******************************************************************/
app.get('/', (req, res) => {
  res.send('Hello, world!');
});
app.use('/api/auth', authRouter);
app.use('/api/photos', photosRouter);

/*******************************************************************
  ERROR HANDLING
*******************************************************************/
// Catch-all 404 handler
app.use((req, res, next) => {
  const err = new Error('Path Not Found');
  err.status = 404;
  next(err); // goes to errorHandler
});
app.use(errorHandler);

/*******************************************************************
  EXPORTS
*******************************************************************/
module.exports = app;