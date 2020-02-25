DROP TABLE IF EXISTS videos;

CREATE TABLE videos (
  id SERIAL PRIMARY KEY,
  video_url TEXT NOT NULL,
  video_title TEXT NOT NULL,
  video_description TEXT,
  author_id uuid REFERENCES users(id) ON DELETE CASCADE NOT NULL,
  group_id uuid REFERENCES groups(id) ON DELETE CASCADE NOT NULL
)