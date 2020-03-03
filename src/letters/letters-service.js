const lettersService = {
  getLetters: (db, group_id) => {
    return db('letters')
      .select('*')
      .where({ group_id })
  }
}

module.exports = lettersService;