const photosService = {
  getPhotos: (db, group_id) => {
    return db('photos')
      .select('*')
      .where({ group_id })
  }
}

module.exports = photosService;