const winston = require('winston');
const { NODE_ENV } = require('../config');

// creates logger with specified settings 
const logger = winston.createLogger({
  level: 'info',
  format: winston.format.json(),
  transports: [new winston.transports.File({ filename: 'info.log' })],
});

// if in development when receiving an error, only log with simple format, not json.
if (NODE_ENV !== 'production') {
  logger.add(
    new winston.transports.Console({
      format: winston.format.simple(),
    })
  );
}

module.exports = logger;