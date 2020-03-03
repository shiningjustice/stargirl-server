'use strict';

const { JsonWebToken } = require('jsonwebtoken');
const authService = require('../auth/auth-service');

async function protectedWithJWT(req, res, next) {
  const token = req.get('Authorization');

  // if bearer token isn't present (is false or lacks "bearer " prefix) 
  // return error
  if (!token || !token.toLowerCase().startsWith('bearer ')) {
    return res.status(401).json({ error: 'missing bearer token' });
  }

  // remove "bearer " prefix from token
  const bearerToken = token.slice(7, token.length);

  try {
    // check if the authorization is valid (attached to a user)
    const payload = authService.verifyJWT(bearerToken);
    const user = await authService.getUser(req.app.get('db'), payload.sub);

    if (!user) {
      return res.status(401).json({ error: 'authorized request' });
    }

    req.user = user;
    next();
  } catch (error) {
    // not sure what this is saying
    if (error instanceof JsonWebToken) {
      return res.status(401).json({ error: 'unauthorized request' })
    }
  }
}

// userful to get user info from a request, e.g., if a user wants to post something
async function getUserFromToken(req, res, next) {
  const token = req.get('Authorization');
  if (token && token.toLowerCase().startsWith('bearer ')) {
    try {
      const payload = authService.verifyJWT(token.slice(7, token.length));
      const user = await authService.getUser(req.app.get('db'), payload.sub);

      if (user) {
        req.user = user;
      }
      next();
    } catch (error) {
      next(error);
    }
  } else {
    next();
  }
}

module.exports = { protectedWithJWT, getUserFromToken };