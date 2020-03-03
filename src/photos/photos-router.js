const express = require('express');
const photosRouter = express.Router();
const photosService = require('./photos-service');
const usersService = require('../users/users-service');
const { protectedWithJWT } = require('../middleware/token-auth');

photosRouter
  .use(protectedWithJWT)
  .use(async (req, res, next) => {
    // get groupId and attached to req
    try {
      const resultsObject = await usersService.getGroupId(
        req.app.get('db'),
        req.user.id
      );

      const groupId = resultsObject.group_id;

      if (!groupId) {
        return res.status(400).json({ error: 'no submissions available' });
      };

      req.groupId = groupId;
      next();
    } catch (error) {
      next(error);
    }
    })

  .route('/')
  .get(async (req, res, next) => {  
    try {
      // get and validate photos. if photos ok, return
      const result = await photosService.getPhotos(
        req.app.get('db'), 
        req.groupId
      );

      if (!!result.length) {
        return res.status(200).json(result);
      } else {
        return res.status(400).json({ error: 'no submissions available' });
      }
    } catch (error) {
      next(error);
    }  
  })

module.exports = photosRouter;