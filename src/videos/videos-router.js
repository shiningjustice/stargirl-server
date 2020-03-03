const express = require('express');
const videosRouter = express.Router();
const videosService = require('./videos-service');
const usersService = require('../users/users-service');
const { protectedWithJWT } = require('../middleware/token-auth');

videosRouter
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
      // if videos available, return, else return error
      const result = await videosService.getVideos(
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

module.exports = videosRouter;