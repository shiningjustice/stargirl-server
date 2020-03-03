DROP TABLE IF EXISTS letters;

CREATE TABLE letters (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  content TEXT [] NOT NULL,
  author_id uuid REFERENCES users(id) ON DELETE CASCADE NOT NULL,
  group_id uuid REFERENCES groups(id) ON DELETE CASCADE NOT NULL
)