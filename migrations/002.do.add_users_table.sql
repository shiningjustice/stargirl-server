DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id uuid PRIMARY KEY,
  username text NOT NULL,
  password text NOT NULL,
  group_id uuid REFERENCES groups(id) ON DELETE CASCADE NOT NULL
)