const usersService = {
  // for getUser function, see authServer
  getGroupId: (db, id) => {
    return db('users')
      .select('group_id')
      .where({ id })
      .first()
  }
}

module.exports = usersService;