DROP TABLE IF EXISTS videos;

CREATE TABLE videos (
  id SERIAL PRIMARY KEY,
  video_url TEXT NOT NULL,
  video_title TEXT NOT NULL,
  video_description TEXT,
  timestamp TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  user_id uuid NOT NULL,
  group_id uuid NOT NULL
)