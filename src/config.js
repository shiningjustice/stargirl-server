//sets defaults for values in process.env, if unavailable

module.exports = {
  PORT: process.env.PORT || 8000, 
  NODE_ENV: process.env.NODE_ENV || 'development', 
  CLIENT_ORIGIN: 
    process.env.NODE_ENV === 'production'
      ? process.env.CLIENT_ORIGIN
      : 'http://localhost:3000',
  DATABASE_URL: 
    process.env.NODE_ENV === 'test'
      ? process.env.TEST_DB_URL
      : process.env.DATABASE_URL,
  JWT_SECRET: process.env.JWT_SECRET
}