const videosService = {
  getVideos: (db, group_id) => {
    return db('videos')
      .select('*')
      .where({ group_id })
  }
}

module.exports = videosService;