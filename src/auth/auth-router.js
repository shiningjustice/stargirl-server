'use strict';

const express = require('express');
const authRouter = express.Router();
const authService = require('./auth-service');
const { protectedWithJWT } = require('../middleware/token-auth');
const xss = require('xss');

authRouter
  .route('/')
  .post(express.json(), async (req, res, next) => {
    let { username, password } = req.body;
    try {
      // if username or password field is blank, return an error
      if (!username || !password) {
        return res.status(400).json({ error: 'username and password are required'})
      }
      
      // sanitize body
      username = xss(username);
      password = xss(password);

      // get user from db. if user doesn't exist, return an error
      const user = await authService.getUser(req.app.get('db'), username);
      if (!user) {
        return res.status(400).json({ error: 'invalid username or password' });
      }

      // if password is incorrect, return an error (should be same error as prior)
      const isValidPassword = await authService.validatePassword(
        req.app.get('db'),
        username,
        password
      );
      if (!isValidPassword) {
        return res.status(400).json({ error: 'invalid username or password' });
      }

      // otherwise, return success code with generated auth token
      const authToken = await authService.createJWT(username, {
        id: user.id,
        username,
      });

      res.send({ authToken });
    } catch (error) {
      next(error);
    }

  })
  
  .put(protectedWithJWT, (req, res) => {
    const sub = req.user.username;
    const payload = {
      id: req.user.id,
      username: req.user.username,
    };
    return res.send({ stargirlAuthToken: authService.createJWT(sub, payload)})
  })

module.exports = authRouter;